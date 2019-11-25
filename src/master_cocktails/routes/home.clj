(ns master_cocktails.routes.home
  (:require [compojure.core :refer :all]
            [selmer.parser :refer [render-file]]
            [compojure.response :refer [render]]
            [buddy.auth :refer [authenticated?]]
            [master_cocktails.models.db :as data-base]
            [ring.util.response :refer [redirect]]))

(defn is-admin? [session]
  (and (authenticated? session)
       (= "admin" (:role (:identity session)))))

(defn go-to-home [page session]
  (render-file page
               {:logged (:identity session)}))

(defn home [session]
  (cond
    (not (authenticated? session))
    (redirect "/login")
    (is-admin? session)
    (go-to-home "templates/admin-home-page.html" session)
    :else
    (go-to-home "templates/user-home-page.html" session)))

(defroutes home-routes
           (GET "/" request (home (:session request))))
