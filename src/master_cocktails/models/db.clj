(ns master_cocktails.models.db
  (:require [clojure.java.jdbc :as sql]
            [korma.core :as kor]
            [korma.db :refer [defdb mysql]]
            [clj-time.coerce :as coerce]
            [clj-time.core :as time])
  (:import java.sql.DriverManager))

(def db-config (clojure.edn/read-string (slurp "configuration/db-config.edn")))

(defdb db (mysql db-config))

(kor/defentity user
               (kor/table :user))

(kor/defentity season
               (kor/table :season))

(kor/defentity style
               (kor/table :style))

(kor/defentity cocktail-strength
               (kor/table :cocktail-strength))

(kor/defentity moment
               (kor/table :moment))

(kor/defentity cocktail
               (kor/table :cocktail))

(defn add-user [params]
  (kor/insert user
              (kor/values params)))

(defn find-user-from-db [params]
  (kor/select user
              (kor/where params)))
(defn get-cocktails []
  (kor/select cocktail
              (kor/fields :* [:style.name :sname])
              (kor/fields :* [:season.name :seas-name])
              (kor/fields :* [:moment.name :mname])
              (kor/fields :* [:cocktail-strength.name :strename])
              (kor/join style (= :style :style.id))
              (kor/join season (= :season :season.id))
              (kor/join moment (= :moment :moment.id))
              (kor/join cocktail-strength (= :cocktail-strength :cocktail-strength.id))
              (kor/order :id :ASC)))
(defn find-cocktail [params]
  (kor/select cocktail
              (kor/fields :* [:style.name :sname])
              (kor/fields :* [:season.name :seas-name])
              (kor/fields :* [:moment.name :mname])
              (kor/fields :* [:cocktail-strength.name :strename])
              (kor/join style (= :style :style.id))
              (kor/join season (= :season :season.id))
              (kor/join moment (= :moment :moment.id))
              (kor/join cocktail-strength (= :cocktail-strength :cocktail-strength.id))
              (kor/where params)
              (kor/order :id :ASC)))

(defn get-styles []
  (kor/select style
              (kor/order :id :ASC)))

(defn find-style [params]
  (kor/select style
            (kor/where params)
            (kor/order :id :ASC)))

(defn get-seasons []
  (kor/select season
              (kor/order :id :ASC)))

(defn get-moments []
  (kor/select moment
              (kor/order :id :ASC)))
(defn get-strengths []
  (kor/select cocktail-strength
              (kor/order :id :ASC)))

(defn delete-cocktail [id]
  (kor/delete cocktail
              (kor/where {:id id})))

(defn update-cocktail [params]
  (kor/update cocktail
              (kor/set-fields params)
              (kor/where {:id (:id params)})))
