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
  (.setCocktail_strength ?q 1)
  (.setText ?q "season?")
  (.setSuggestedAnswers ?q ["Fall" "Spring" "Summer" "Winter" "All seasons"])
  )

(defrule alcoholic-yes
  [?q <- Question (=  "alcoholic?" text) (= "yes" answer)]
  =>
  (.setText ?q "strength?")
  (.setSuggestedAnswers ?q ["Weak" "Light" "Medium" "Strong"])
  )

(defrule alcoholic-yes-strength-weak
  [?q <- Question (=  "strength?" text) (= "Weak" answer)]
  =>
  (.setCocktail_strength ?q 2)
  (.setText ?q "season?")
  (.setSuggestedAnswers ?q ["Fall" "Spring" "Summer" "Winter" "All seasons"])
  )

(defrule alcoholic-yes-strength-light
  [?q <- Question (=  "strength?" text) (= "Light" answer)]
  =>
  (.setCocktail_strength ?q 3)
  (.setText ?q "season?")
  (.setSuggestedAnswers ?q ["Fall" "Spring" "Summer" "Winter" "All seasons"])
  )

(defrule alcoholic-yes-strength-medium
  [?q <- Question (=  "strength?" text) (= "Medium" answer)]
  =>
  (.setCocktail_strength ?q 4)
  (.setText ?q "season?")
  (.setSuggestedAnswers ?q ["Fall" "Spring" "Summer" "Winter" "All seasons"])
  )

(defrule alcoholic-yes-strength-strong
  [?q <- Question (=  "strength?" text) (= "Strong" answer)]
  =>
  (.setCocktail_strength ?q 5)
  (.setText ?q "season?")
  (.setSuggestedAnswers ?q ["Fall" "Spring" "Summer" "Winter" "All seasons"])
  )

(defrule alcoholic-yes-strength-strong-season-fall
  [?q <- Question (=  "season?" text) (= "Fall" answer)]
  =>
  (.setCocktail_season ?q 1)
  (.setText ?q "moment?")
  (.setSuggestedAnswers ?q ["Company Party/ Family Gathering" "Girls' Night" "Guys' Night" "Beach/ Barbecue & Picnic" "Poolside/ Taking Time for Yourself " "All moments"])

  )
(defrule alcoholic-yes-strength-strong-season-spring
  [?q <- Question (=  "season?" text) (= "Spring" answer)]
  =>
  (.setCocktail_season ?q 2)
  (.setText ?q "moment?")
  (.setSuggestedAnswers ?q ["Company Party/ Family Gathering" "Girls' Night" "Guys' Night" "Beach/ Barbecue & Picnic" "Poolside/ Taking Time for Yourself " "All moments"])

  )
(defrule alcoholic-yes-strength-strong-season-summer
  [?q <- Question (=  "season?" text) (= "Summer" answer)]
  =>
  (.setCocktail_season ?q 3)
  (.setText ?q "moment?")
  (.setSuggestedAnswers ?q ["Company Party/ Family Gathering" "Girls' Night" "Guys' Night" "Beach/ Barbecue & Picnic" "Poolside/ Taking Time for Yourself " "All moments"])
  )
(defrule alcoholic-yes-strength-strong-season-winter
  [?q <- Question (=  "season?" text) (= "Winter" answer)]
  =>
  (.setCocktail_season ?q 4)
  (.setText ?q "moment?")
  (.setSuggestedAnswers ?q ["Company Party/ Family Gathering" "Girls' Night" "Guys' Night" "Beach/ Barbecue & Picnic" "Poolside/ Taking Time for Yourself " "All moments"])

  )
(defrule alcoholic-yes-strength-strong-season-all
  [?q <- Question (=  "season?" text) (= "All seasons" answer)]
  =>
  (.setCocktail_season ?q 5)
  (.setText ?q "moment?")
  (.setSuggestedAnswers ?q ["Company Party/ Family Gathering" "Girls' Night" "Guys' Night" "Beach/ Barbecue & Picnic" "Poolside/ Taking Time for Yourself " "All moments"])
  )
(defrule alcoholic-yes-moment-company
  [?q <- Question (=  "moment?" text) (= "Company Party/ Family Gathering" answer)]
  =>
  (.setCocktail_moment ?q 1)
  (.setStyleName ?q "Frozen")
  )

(defrule alcoholic-yes-moment-girls
  [?q <- Question (=  "moment?" text) (= "Girls' Night" answer)]
  =>
  (.setCocktail_moment ?q 2)
  (.setStyleName ?q "Frozen")
  )
(defrule alcoholic-yes-moment-guys
  [?q <- Question (=  "moment?" text) (= "Guys' Night" answer)]
  =>
  (.setCocktail_moment ?q 3)
  (.setStyleName ?q "Frozen")
  )
(defrule alcoholic-yes-moment-beach
  [?q <- Question (=  "moment?" text) (= "Beach/ Barbecue & Picnic" answer)]
  =>
  (.setCocktail_moment ?q 4)
  (.setStyleName ?q "Frozen")
  )
(defrule alcoholic-yes-moment-poolside
  [?q <- Question (=  "moment?" text) (= "Poolside/ Taking Time for Yourself " answer)]
  =>
  (.setCocktail_moment ?q 5)
  (.setStyleName ?q "Frozen")
  )
(defrule alcoholic-yes-moment-all
  [?q <- Question (=  "moment?" text) (= "All moments" answer)]
  =>
  (.setCocktail_moment ?q 6)
  (.setStyleName ?q "Frozen")
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
