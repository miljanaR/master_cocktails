(ns master_cocktails.models.rule
  (:require [compojure.core :refer :all]
            [master_cocktails.models.question :refer :all]
            [clara.rules :refer :all])
  (:import [master_cocktails.models.question Question])
  )

(defrule price
  [?q <- Question (= nil text) (= nil answer)]
  =>
  (.setText ?q "Da li birate skuplji ili jeftiniji koktel?")
  (.setPrice ?q 0)
  (.setColor ?q "blue")
  (.setSuggestedAnswers ?q ["skuplji" "jeftiniji"])
  )

(defrule price-1
  [?q <- Question (= "Da li birate skuplji ili jeftiniji koktel?" text) (= "skuplji" answer)]
  =>
  (.setPrice ?q 1)
  (.setText ?q "Odaberite zeljenu boju koktela")
  (.setSuggestedAnswers ?q ["blue" "red" "brown" "any color"])
  )

(defrule price-0
  [?q <- Question (= "Da li birate skuplji ili jeftiniji koktel?" text) (= "jeftiniji" answer)]
  =>
  (.setPrice ?q 0)
  (.setText ?q "Odaberite zeljenu boju koktela")
  (.setSuggestedAnswers ?q ["blue" "red" "brown" "any color"])
  )

(defrule color-nil
  [?q <- Question (= "Odaberite zeljenu boju koktela" text) (= "any color" answer)]
  =>
  (.setColor ?q nil)
  (.setStyleName ?q "Frozen")
  (.setText ?q "alcoholic?")
  (.setSuggestedAnswers ?q ["yes" "no"])
  )

(defrule color-notnil
  [?q <- Question (= "Odaberite zeljenu boju koktela" text) (not= "any color" answer)]
  =>
  (.setColor ?q (.getAnswer ?q))
  (.setText ?q "alcoholic?")
  (.setSuggestedAnswers ?q ["yes" "no"])
  )

(defrule alcoholic-no
  [?q <- Question (=  "alcoholic?" text) (= "no" answer)]
  =>
  (.setStyleName ?q "Frozen")
  (.setCocktail_strength ?q 1)
  )

(defrule alcoholic-yes
  [?q <- Question (=  "alcoholic?" text) (= "yes" answer)]
  =>
  (.setText ?q "strength?")
  (.setSuggestedAnswers ?q ["Weak" "Light" "Medium" "Strong"])
  )

(defrule alcoholic-yesstrength-weak
  [?q <- Question (=  "strength?" text) (= "Weak" answer)]
  =>
  (.setStyleName ?q "Frozen")
  (.setCocktail_strength ?q 2)
  )

(defrule alcoholic-yesstrength-wlight
  [?q <- Question (=  "strength?" text) (= "Light" answer)]
  =>
  (.setStyleName ?q "Frozen")
  (.setCocktail_strength ?q 3)
  )

(defrule alcoholic-yesstrength-medium
  [?q <- Question (=  "strength?" text) (= "Medium" answer)]
  =>
  (.setStyleName ?q "Frozen")
  (.setCocktail_strength ?q 4)
  )

(defrule alcoholic-yesstrength-strong
  [?q <- Question (=  "strength?" text) (= "Strong" answer)]
  =>
  (.setStyleName ?q "Frozen")
  (.setCocktail_strength ?q 5)
  )

(defquery get-question []
  [?q <- Question])

(defn show-question [session]
  (query session get-question))

(defn ask-question [q]
  (println "-------------:" q)
  (-> (mk-session 'master_cocktails.models.rule)
      (insert q)
      (fire-rules)
      (show-question)))
