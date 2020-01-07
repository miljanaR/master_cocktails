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

(kor/defentity strength
               (kor/table :strength))

(kor/defentity moment
               (kor/table :moment))

(kor/defentity cocktail
               (kor/table :cocktail))

(kor/defentity favourites
               (kor/table :favourites))

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
              (kor/fields :* [:strength.name :strename])
              (kor/join style (= :style :style.id))
              (kor/join season (= :season :season.id))
              (kor/join moment (= :moment :moment.id))
              (kor/join strength (= :strength :strength.id))
              (kor/order :id :ASC)))

(defn find-favourite-cocktails [user_id]
  (kor/select favourites
              (kor/fields :* :cocktail.name :cocktail.id :cocktail.picture :user :user.id )
              (kor/join user (= :user :user.id))
              (kor/join cocktail (= :cocktail :cocktail.id))
              (kor/where {:user user_id})))

(defn find-cocktail [params]
  (kor/select cocktail
              (kor/fields :* [:style.name :sname])
              (kor/fields :* [:season.name :seas-name])
              (kor/fields :* [:moment.name :mname])
              (kor/fields :* [:strength.name :strename])
              (kor/join style (= :style :style.id))
              (kor/join season (= :season :season.id))
              (kor/join moment (= :moment :moment.id))
              (kor/join strength (= :strength :strength.id))
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
  (kor/select strength
              (kor/order :id :ASC)))
(defn add-favourites [params]
  (kor/insert favourites
              (kor/values params)))
(defn delete-favourites [params]
  (kor/delete favourites
            (kor/where params)))
(defn find-fav [params]
  (kor/select favourites
            (kor/where params)))

(defn delete-cocktail [id]
  (kor/delete cocktail
              (kor/where {:id id})))

(defn update-cocktail [params]
  (kor/update cocktail
              (kor/set-fields params)
              (kor/where {:id (:id params)})))
