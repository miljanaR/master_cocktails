(ns master_cocktails.routes.questions
  (:require [compojure.core :refer :all]
            [master_cocktails.models.question :refer :all]
            [master_cocktails.models.db :as db]
            [master_cocktails.models.rule :as rules]
            [selmer.parser :refer [render-file]]
            [ring.util.response :refer [redirect]]
            [liberator.core :refer [defresource]]
            [clojure.data.json :as json]
            [buddy.auth :refer [authenticated?]])
  (:import [master_cocktails.models.question Question]))

(defn question->map [q]
  (.setAnswer q nil)
  (if-not (nil? (.getStyleName q))
    (.setStyleId q (->(.getStyleName q)
                      (hash-map :name)
                      (db/find-style)
                      (first)
                      (:id))))
  (println "*****************: " q)
  {:text (.getText q)
   :answer (.getAnswer q)
   :suggestedAnswers (.getSuggestedAnswers q)
   :id (.getStyleId q)
   :style (.getStyleName q)
   :price (.getPrice q)
   :color (.getColor q)
   })

(defn map->question [{:keys [question]}]
  (->Question (:text question)
              (:answer question)
              (:suggestedAnswers nil)
              (:id question)
              (:style question)
              (:price question)
              (:color question)
              ))

(defn get-question-page [{:keys [params session]}]
  (if-not (authenticated? session)
    (redirect "/login")
    (render-file "templates/question.html" {:title "Questions"
                                            :logged (:identity session)})))

(defn get-question-from-rules [params]
  (-> (map->question params)
      (rules/ask-question)
      (first)
      (:?q)
      (question->map)))

(defn find-style-result [{:keys [params session]}]
  (if-not (authenticated? session)
    (redirect "/login")
    (render-file "templates/view-suggestion.html" {:title "Style"
                                              :logged (:identity session)
                                              :style (first (db/find-style (select-keys params [:id])))
                                              :cocktails (db/find-cocktail (select-keys params [:style :price :color]))})))

(defresource get-question [{:keys [params session]}]
             :allowed-methods [:post]
             :authorized? (fn [_] (authenticated? session))
             :new? false
             :respond-with-entity? true
             :handle-ok (fn [_] (json/write-str (get-question-from-rules params)))
             :available-media-types ["application/json"])

(defroutes question-routes
           (GET "/questions" request (get-question-page request))
           (POST "/questions" request (get-question request))
           (GET "/result" request (find-style-result request)))
