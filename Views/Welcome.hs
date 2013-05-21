{-# LANGUAGE OverloadedStrings #-}
module Views.Welcome where

import Text.Blaze.Html5
import Text.Blaze.Html5.Attributes
import qualified Text.Blaze.Html5 as H
import qualified Text.Blaze.Html5.Attributes as A
import Text.Blaze.Html.Renderer.Text
import Data.Monoid
import DataStructures

welcome :: Result -> Html
welcome r = H.div ! class_ "hero-unit geddy-welcome-box" $ do
    h1 "Should I Tweet This?"
    p "We all want to bring a positive message to the world, but sometimes actions are faster than thought. Use 'Should I Tweet This?' as the tact filter that you don't have."
    H.form ! A.id "sendtweet" ! method "post" $ do
        textarea ! placeholder "Type your tweet here..." ! name "tweet" $ mempty
        br
        input ! type_ "submit" ! value "Bombs Away!" ! class_ "btn btn-primary btn-large"

    case r of
      Start -> H.div ! class_ "alert alert-error hide" $ do
        i ! class_ "icon-trash pull-left" $ mempty
        "Better not"
      Nah -> H.div ! class_ "alert alert-error " $ do
        i ! class_ "icon-trash pull-left" $ mempty
        "Better not"
