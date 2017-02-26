module Signal.Aff.Channel (channel, send) where

import Prelude (Unit, ($))

import Control.Monad.Aff       (Aff())
import Control.Monad.Eff.Class (liftEff)
import Signal.Channel          (CHANNEL, Channel(), channel, send) as S

channel :: forall a e. a -> Aff (channel :: S.CHANNEL | e) (S.Channel a)
channel a = liftEff $ S.channel a

send :: forall a e. S.Channel a -> a -> Aff (channel :: S.CHANNEL | e) Unit
send chan a = liftEff $ S.send chan a
