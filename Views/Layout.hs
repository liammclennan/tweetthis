{-# LANGUAGE OverloadedStrings #-}
module Views.Layout where

import Text.Blaze.Html5
import Text.Blaze.Html5.Attributes
import qualified Text.Blaze.Html5 as H
import qualified Text.Blaze.Html5.Attributes as A
import Text.Blaze.Html.Renderer.Text
import Data.Monoid

template :: Html -> Html
template c = docTypeHtml $ do
  H.head $ do
    meta ! charset "utf-8"
    H.title "Should I Tweet?"
    meta ! name "description" ! content ""
    meta ! name "author" ! content ""
    meta ! name "viewport" ! content "width=device-width"
    --  The HTML5 shim, for IE6-8 support of HTML elements 
    -- [if lt IE 9]>
    --       <script src="http://html5shim.googlecode.com/svn/trunk/html5.js" type="text/javascript"></script>
    --     <![endif]
    script ! src "/js/jquery.min.js" ! type_ "text/javascript" $ mempty
    script ! src "/js/bootstrap.min.js" ! type_ "text/javascript" $ mempty
    script ! src "/js/core/core.js" ! type_ "text/javascript" $ mempty
    script ! src "/js/config/init.js" ! type_ "text/javascript" $ mempty
    link ! href "/css/bootstrap.min.css" ! rel "stylesheet"
    link ! href "/css/style.css" ! rel "stylesheet"
    link ! href "/css/bootstrap.responsive.min.css" ! rel "stylesheet"
  body $ do
    H.div ! class_ "navbar navbar-fixed-top" $ H.div ! class_ "navbar-inner" $ H.div ! class_ "container" $ do
      a ! class_ "btn btn-navbar" ! dataAttribute "toggle" "collapse" ! dataAttribute "target" ".nav-collapse" $ H.span ! class_ "i-bar" $ i ! class_ "icon-chevron-down icon-white" $ mempty
      a ! class_ "brand" ! href "/" $ "Should I Tweet?"
      H.div ! class_ "nav-collapse" $ ul ! class_ "nav" $ li ! class_ "active" $ a ! href "/" $ "Home"
    H.div ! class_ "container" $ do
      c
