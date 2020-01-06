(ns master_cocktails.routes.cocktail
  (:require [compojure.core :refer :all]
            [selmer.parser :refer [render-file]]
            [master_cocktails.models.db :as db]
            [compojure.response :refer [render]]
            [buddy.auth :refer [authenticated?]]
            [liberator.core :refer [defresource]]
            [clojure.data.json :as json]
            [liberator.representation :refer [ring-response as-response]]
            [clojure.set :refer [rename-keys]]
            [ring.util.response :refer [redirect]]))

(defn get-cocktails [text]
  (if (or (nil? text)
          (= "" text))
    (db/get-cocktails)
    ))
(defn authenticated-admin? [session]
  (and (authenticated? session)
       (= "admin" (:role (:identity session)))))

(defn get-search-cocktails [params session]
  (render-file "templates/cocktails-view.html" {:title     "Preview cocktails"
                                                :logged    (:identity session)
                                                :cocktails (get-cocktails nil)}))

(defresource preview-cocktails [{:keys [params session]}]
             :allowed-methods [:get]
             :available-media-types ["text/html" "application/json"]
             :handle-ok #(let [media-type (get-in % [:representation :media-type])]
                           (condp = media-type
                             "text/html" (get-search-cocktails params session)
                             "application/json" (-> (:text params)
                                                    (get-cocktails)
                                                    (json/write-str)))))
(defn get-cocktail-page [page params session & [message]]
  (println params)
  (render-file page {:title     (str "Cocktail " (:id params))
                     :logged    (:identity session)
                     :message   message
                     :cocktail  (first (db/find-cocktail params))
                     :styles    (db/get-styles)
                     :seasons   (db/get-seasons)
                     :moments   (db/get-moments)
                     :strengths (db/get-strengths)
                     :liked (count (db/find-fav (hash-map :cocktail (:id params) :user (:id (:identity session)))))
                     }))

(defn get-cocktail [{:keys [params session]} & [message]]
  (cond
    (not (authenticated? session))
    (redirect "/login")
    (authenticated-admin? session)
    (get-cocktail-page "templates/cocktail-admin.html" params session message)
    :else
    (get-cocktail-page "templates/cocktail-user.html" params session message)))



(defresource update-cocktail [{:keys [params session]}]
             :allowed-methods [:put]
             :available-media-types ["application/json"]
             (println params)
             (db/update-cocktail params))

(defresource delete-cocktail [{:keys [params session]}]
             :allowed-methods [:delete]
             :authorized? (authenticated-admin? session)
             :new? false
             :delete! (fn [_] (db/delete-cocktail (:id params)))
             :available-media-types ["application/json"])

(defroutes cocktail-routes
           (GET "/cocktails" request (preview-cocktails (:session request)))
           (PUT "/cocktail" request (update-cocktail request))
           (DELETE "/cocktail" request (delete-cocktail request))
           (GET "/cocktail/:id" request (get-cocktail request)))



