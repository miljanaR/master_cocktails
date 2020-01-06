(ns master_cocktails.models.rule
  (:require [compojure.core :refer :all]
            [master_cocktails.models.question :refer :all]
            [clara.rules :refer :all])
  (:import [master_cocktails.models.question Question])
  )

(defrule price
  [?q <- Question (= nil text) (= nil answer)]
  =>
  (.setText ?q "Do you prefer classic or special cocktails?")
  (.setPrice ?q 0)
  (.setSuggestedAnswers ?q [ "special" "classic"])
  )

(defrule price-1
  [?q <- Question (= "Do you prefer classic or special cocktails?" text) (= "special" answer)]
  =>
  (.setPrice ?q 1)
  (.setText ?q "Choose color for cocktail")
  (.setSuggestedAnswers ?q ["any color" "blue" "red/orange/pink" "brown" "other"])
  )

(defrule price-0
  [?q <- Question (= "Do you prefer classic or special cocktails?" text) (= "classic" answer)]
  =>
  (.setPrice ?q 0)
  (.setText ?q "Choose color for cocktail")
  (.setSuggestedAnswers ?q ["any color" "blue" "red/orange/pink" "brown" "other"])
  )

(defrule color-nil
  [?q <- Question (= "Choose color for cocktail" text) (= "any color" answer)]
  =>
  (.setColor ?q nil)
  (.setText ?q "strength?")
  (.setSuggestedAnswers ?q [ "Light" "Medium" "Strong"])
  )

(defrule color-notnil
  [?q <- Question (=  "Choose color for cocktail" text) (not= "any color" answer)]
  =>
  (.setColor ?q (.getAnswer ?q))
  (.setText ?q "strength?")
  (.setSuggestedAnswers ?q [ "Light" "Medium" "Strong"])
  )

(defrule alcoholic-yes-strength-light
  [?q <- Question (=  "strength?" text) (= "Light" answer)]
  =>
  (.setCocktail_strength ?q 3)
  (.setText ?q "the main ingredient?")
  (.setSuggestedAnswers ?q ["Vodka" "gin" "rum" "other"])
  )

(defrule alcoholic-yes-strength-medium
  [?q <- Question (=  "strength?" text) (= "Medium" answer)]
  =>
  (.setCocktail_strength ?q 4)
  (.setText ?q "the main ingredient?")
  (.setSuggestedAnswers ?q [ "Tequila" "gin" "Whiskey" "rum" "other"])
  )

(defrule alcoholic-yes-strength-strong
  [?q <- Question (=  "strength?" text) (= "Strong" answer)]
  =>
  (.setCocktail_strength ?q 5)
  (.setText ?q "the main ingredient?")
  (.setSuggestedAnswers ?q ["Vodka" "Tequila"  "Whiskey" "other"])
  )

(defrule alcoholic-yes-main-ingredient
  [?q <- Question (=  "the main ingredient?" text)(not= nil answer)]
  =>
  (.setCocktail_main_ingredient ?q (.getAnswer ?q))
  (.setText ?q "season?")
  (.setSuggestedAnswers ?q ["All seasons" "Fall/Winter" "Spring/Summer"  ])
  )

(defrule alcoholic-yes-strength-strong-season-fall
  [?q <- Question (=  "season?" text) (= "Fall/Winter" answer)]
  =>
  (.setCocktail_season ?q 5)
  (.setText ?q "moment?")
  (.setSuggestedAnswers ?q [  "All moments" "Company Party/ Family Gathering"  "Night Out"  ])

  )
(defrule alcoholic-yes-strength-strong-season-spring
  [?q <- Question (=  "season?" text) (= "Spring/Summer" answer)]
  =>
  (.setCocktail_season ?q 5)
  (.setText ?q "moment?")
  (.setSuggestedAnswers ?q [ "All moments" "Company Party/ Family Gathering"  "Beach/ Barbecue & Picnic" "Poolside/ Taking Time for Yourself "])

  )

(defrule alcoholic-yes-strength-strong-season-all
  [?q <- Question (=  "season?" text) (= "All seasons" answer)]
  =>
  (.setCocktail_season ?q 5)
  (.setText ?q "moment?")
  (.setSuggestedAnswers ?q [  "All moments" "Company Party/ Family Gathering"  "Night Out" "Beach/ Barbecue & Picnic" "Poolside/ Taking Time for Yourself " ])
  )
(defrule alcoholic-yes-moment-company
  [?q <- Question (=  "moment?" text) (= "Company Party/ Family Gathering" answer)]
  =>
  (.setCocktail_moment ?q 1)
  (.setText ?q "style?")
  (.setSuggestedAnswers ?q [ "Martini" "Classic" "Longdrink/Tropical"])
  )

(defrule alcoholic-yes-moment-girls
  [?q <- Question (=  "moment?" text) (= "Night Out" answer)]
  =>
  (.setCocktail_moment ?q 2)
  (.setText ?q "style?")
  (.setSuggestedAnswers ?q [ "Martini" "Classic"  "Longdrink/Tropical"])
  )

(defrule alcoholic-yes-moment-beach
  [?q <- Question (=  "moment?" text) (= "Beach/ Barbecue & Picnic" answer)]
  =>
  (.setCocktail_moment ?q 4)
  (.setText ?q "style?")
  (.setSuggestedAnswers ?q ["Martini" "Classic"  "Longdrink/Tropical"  ])
  )
(defrule alcoholic-yes-moment-poolside
  [?q <- Question (=  "moment?" text) (= "Poolside/ Taking Time for Yourself " answer)]
  =>
  (.setCocktail_moment ?q 5)
  (.setText ?q "style?")
  (.setSuggestedAnswers ?q [ "Classic"  "Longdrink/Tropical" ])
  )
(defrule alcoholic-yes-moment-all
  [?q <- Question (=  "moment?" text) (= "All moments" answer)]
  =>
  (.setCocktail_moment ?q 6)
  (.setText ?q "style?")
  (.setSuggestedAnswers ?q ["Martini" "Classic" "Longdrink/Tropical" "Short"   ])
  )
(defrule style
  [?q <- Question (=  "style?" text) (not= nil answer)]
  =>
  (.setStyleName ?q (.getAnswer ?q))
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
