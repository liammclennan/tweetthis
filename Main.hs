{-# LANGUAGE OverloadedStrings #-}

import Web.Scotty
import qualified Views.Layout as L
import qualified Views.Welcome as W
import Text.Blaze.Html.Renderer.Text (renderHtml)
import Network.Wai.Middleware.Static
import Network.HTTP.Types (status302)
import DataStructures
import Data.Text.Lazy.Encoding (decodeUtf8)
import GHC.Exts
import Evaluator

main = do
  scotty 3000 $ do
    middleware $ staticPolicy (noDots >-> addBase "public")
    get "/" $ htmlPartial $ W.welcome Start

    post "/" $ do
      b <- body
      t <- param "tweet"
      if isOk (t::String) then goTweet (t::String) else htmlPartial $ W.welcome Nah

htmlPartial p = do
  html . renderHtml $ do
    L.template $ p

goTweet t = do
  status status302
  header "Location" $ fromString ("https://twitter.com/intent/tweet?text=" ++ t)