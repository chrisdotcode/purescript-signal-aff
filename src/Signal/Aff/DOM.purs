module Signal.Aff.DOM
	( keyPressed
	, mouseButton
	, touch
	, tap
	, mousePos
	, animationFrame
	, windowDimensions
	) where

import Prelude (($))

import Control.Monad.Aff       (Aff())
import Control.Monad.Eff.Class (liftEff)
import Control.Monad.Eff.Timer (TIMER)
import DOM                     (DOM)
import Signal                  (Signal()) as S
import Signal.DOM
	( CoordinatePair
	, DimensionPair
	, Touch
	, keyPressed
	, mouseButton
	, touch
	, tap
	, mousePos
	, animationFrame
	, windowDimensions
	) as S
import Signal.Time             (Time()) as S

keyPressed :: forall e. Int -> Aff (dom :: DOM | e) (S.Signal Boolean)
keyPressed k = liftEff $ S.keyPressed k

mouseButton :: forall e. Int -> Aff (dom :: DOM | e) (S.Signal Boolean)
mouseButton b = liftEff $ S.mouseButton b

touch :: forall e. Aff (dom :: DOM | e) (S.Signal (Array S.Touch))
touch = liftEff S.touch

tap :: forall e. Aff (dom :: DOM | e) (S.Signal Boolean)
tap = liftEff S.tap

mousePos :: forall e. Aff (dom :: DOM | e) (S.Signal S.CoordinatePair)
mousePos = liftEff S.mousePos

animationFrame :: forall e. Aff (dom :: DOM, timer :: TIMER | e) (S.Signal S.Time)
animationFrame = liftEff S.animationFrame

windowDimensions :: forall e. Aff (dom :: DOM | e) (S.Signal S.DimensionPair)
windowDimensions = liftEff S.windowDimensions
