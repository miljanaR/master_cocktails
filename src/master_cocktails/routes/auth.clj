(ns master_cocktails.routes.auth
  (:require [compojure.core :refer :all]
            [bcrypt-clj.auth :as bcrypt]
            [struct.core :as struct]
            [ring.util.response :refer [redirect]]
            [selmer.parser :refer [render-file]]
            [master_cocktails.models.db :as data-base]))

(def user-login-schema
  {:username [struct/required struct/string]
   :password [struct/required struct/string]})

(def user-register-schema
  {:username [struct/required struct/string]
   :password [struct/required struct/string]
   :name     [struct/required struct/string]
   :surname  [struct/required struct/string]
   :email    [struct/required struct/string]})

(defn validation-log? [params]
  (struct/valid? {:username (:username params)
                  :password (:password params)} user-login-schema))

(defn register-validation? [params]
  (struct/valid? {:username (:username params)
                  :password (:password params)
                  :name     (:name params)
                  :surname  (:surname params)
                  :email    (:email params)} user-register-schema))

(defn get-login-page [& [error]]
  (render-file "templates/login-user-page.html" {:error error}))
(defn registration [& [error]]
  (render-file "templates/user-register.html" {:error error}))

(defn get-user-by-usrnm [params]
  (-> (select-keys params [:username])
      (data-base/find-user-from-db)
      (first)))

(defn manage-login [{:keys [params session]}]
  (let [user (get-user-by-usrnm params)]
    (cond
      (not (validation-log? params))
      (get-login-page "Please enter credentials")
      (or (empty? user)
          (not (bcrypt/check-password (:password params) (:password user))))
      (get-login-page "Bad credentials")
      :else
      (do (assoc (redirect "/") :session (assoc session :identity user))))))

(defn new-user [params]
  (data-base/add-user (assoc params :role "user"))
  (first (data-base/find-user-from-db params)))

(defn save-new-user [params]
  (-> (update-in params [:password] bcrypt/crypt-password)
      (new-user)))

(defn manage-registration [{:keys [params session]}]
  (let [userr (get-user-by-usrnm params)]
    (cond
      (not (register-validation? params))
      (registration "")
      (not-empty userr)
      (registration (str "User with username: " (:username params) " already exists"))
      :else
      (assoc (redirect "/") :session (assoc session :identity (save-new-user params))))))

(defn logout [request]
  (-> (redirect "/login")
      (assoc :session {})))

(defroutes auth-routes
           (GET "/login" [] (get-login-page))
           (GET "/logout" request (logout request))
           (GET "/register" [] (registration))
           (POST "/login" request (manage-login request))
           (POST "/register" request (manage-registration request)))
