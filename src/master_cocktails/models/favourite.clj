(ns master-cocktails.models.favourite
  (:require [compojure.core :refer :all]
            [master_cocktails.models.db :as db]
            [buddy.auth :refer [authenticated?]]
            [liberator.core :refer [defresource]]
            [clojure.data.json :as json]
            [struct.core :as st]))

(defresource handle-favourite [{:keys [params session]}]
             :allowed-methods [:post :delete]
             :post! (fn [_] (db/add-favourites (assoc params :user (:id (:identity session)))))
             :delete! (fn [_] (db/delete-favourites (assoc params :user (:id (:identity session)))))
             :available-media-types ["application/json"])


(defroutes favourite-routes
           (POST "/favourite" request (handle-favourite request))
           (DELETE "/favourite" request (handle-favourite request)))

