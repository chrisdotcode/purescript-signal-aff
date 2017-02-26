module Signal.Aff.Time (now) where

import Control.Monad.Aff       (Aff())
import Control.Monad.Eff.Class (liftEff)
import Control.Monad.Eff.Timer (TIMER)
import Signal.Time             (Time(), now) as S

now :: forall e. Aff (timer :: TIMER | e) S.Time
now = liftEff S.now
