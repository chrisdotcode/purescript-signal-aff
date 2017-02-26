module Signal.Aff (runSignal, runSignal', unwrap, unwrap') where

import Prelude (Unit, const, map, pure, unit, ($), (<<<))

import Control.Monad.Aff       (Aff())
import Control.Monad.Eff       (Eff())
import Control.Monad.Eff.Class (liftEff)
import Signal                  (Signal(), runSignal, unwrap) as S

runSignal :: forall e. S.Signal (Eff e Unit) -> Aff e Unit
runSignal s = liftEff $ S.runSignal s

unwrap :: forall e a. S.Signal (Eff e a) -> Aff e (S.Signal a)
unwrap s = liftEff $ S.unwrap s

foreign import unwrap'Impl :: forall e a b. (a -> Aff e a)     ->
			      ((a -> b) -> Aff e a -> Aff e b) ->
			      S.Signal (Aff e a)               ->
			      Aff e (S.Signal a)

unwrap' :: forall e a. S.Signal (Aff e a) -> Aff e (S.Signal a)
unwrap' = unwrap'Impl pure map

runSignal' :: forall e. S.Signal (Aff e Unit) -> Aff e Unit
runSignal' = map (const unit) <<< unwrap'
