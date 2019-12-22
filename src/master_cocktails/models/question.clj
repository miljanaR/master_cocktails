(ns master_cocktails.models.question
  (:require [compojure.core :refer :all]))

(defprotocol PQuestion
  (getText [this])
  (setText [this val])
  (getAnswer [this])
  (setAnswer [this val])
  (getSuggestedAnswers [this])
  (setSuggestedAnswers [this val])
  (getStyleId [this])
  (setStyleId [this val])
  (getStyleName [this])
  (setStyleName [this val])
  (getPrice [this])
  (setPrice [this val])
  (getColor [this])
  (setColor [this val])
  (getCocktail_strength [this])
  (setCocktail_strength[this val])
  )

(deftype Question
  [^:volatile-mutable text
   ^:volatile-mutable answer
   ^:volatile-mutable suggestedAnswers
   ^:volatile-mutable styleId
   ^:volatile-mutable styleName
   ^:volatile-mutable price
   ^:volatile-mutable color
   ^:volatile-mutable strength
   ]
  PQuestion

  (toString [this] (str "text:" text ",answer:" answer ",suggested:" suggestedAnswers ",id:" styleId ",name:" styleName
                         ",price:" price ",color:" color ", strength"  strength ))
  (getText [this] text)
  (setText [this val] (set! text val))
  (getAnswer [this] answer)
  (setAnswer [this val] (set! answer val))
  (getSuggestedAnswers [this] suggestedAnswers)
  (setSuggestedAnswers [this val] (set! suggestedAnswers val))
  (getStyleId [this] styleId)
  (setStyleId [this val] (set! styleId val))
  (getStyleName [this] styleName)
  (setStyleName [this val] (set! styleName val))
  (getPrice [this] price)
  (setPrice [this val] (set! price val))
  (getColor [this] color)
  (setColor [this val] (set! color val))
  (getCocktail_strength [this] strength)
  (setCocktail_strength [this val] (set! strength val))
 )
