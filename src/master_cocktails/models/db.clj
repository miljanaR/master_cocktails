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
(kor/defentity style
             (kor/table :style))

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
            (kor/join style (= :style :style.id))
            (kor/order :id :ASC)))
(defn find-cocktail [params]
  (kor/select cocktail
            (kor/fields :* [:style.name :sname])
            (kor/join style (= :style :style.id))
            (kor/where params)
            (kor/order :id :ASC)))

(defn get-styles []
  (kor/select style
            (kor/order :id :ASC)))

