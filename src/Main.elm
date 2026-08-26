module Main exposing (main)

import Browser
import Content exposing (Inline(..), Paragraph, bio)
import Html exposing (Html, a, div, h1, h2, h3, p, text)
import Html.Attributes exposing (class, href, id, rel, style, target)


type alias Model =
    ()


type Msg
    = NoOp


main : Program () Model Msg
main =
    Browser.document
        { init = \_ -> ( (), Cmd.none )
        , update = \_ model -> ( model, Cmd.none )
        , subscriptions = \_ -> Sub.none
        , view = \_ -> { title = bio.title, body = [ viewPage ] }
        }


viewPage : Html Msg
viewPage =
    div
        [ style "min-height" "100vh"
        , style "background" "#ffffff"
        , style "color" "#111111"
        , style "font-family" "'IBM Plex Sans', system-ui, sans-serif"
        , style "line-height" "1.6"
        , style "padding" "48px 20px 80px"
        ]
        [ div
            [ style "max-width" "760px"
            , style "margin" "0 auto"
            ]
            [ headerBlock
            , introBlock
            , sectionBlock "history" "История" (List.map viewChapter bio.chapters)
            , sectionBlock "projects" "Проекты" [ viewProjects bio.projects ]
            , footerBlock
            ]
        ]


headerBlock : Html Msg
headerBlock =
    div
        [ style "padding-bottom" "32px"
        , style "margin-bottom" "36px"
        , style "border-bottom" "1px solid #e5e5e5"
        ]
        [ h1
            [ style "margin" "0 0 14px"
            , style "font-size" "clamp(2.6rem, 7vw, 4.6rem)"
            , style "font-weight" "600"
            , style "letter-spacing" "-0.04em"
            ]
            [ text bio.title ]
        , div [ style "display" "flex", style "gap" "20px", style "flex-wrap" "wrap" ]
            (List.map (\contact -> contactLink contact.label contact.url) bio.contacts)
        , navButtons
        ]


navButtons : Html Msg
navButtons =
    div
        [ style "display" "flex"
        , style "gap" "12px"
        , style "margin-top" "24px"
        , style "flex-wrap" "wrap"
        ]
        [ a [ href "#history", class "btn" ] [ text "[ История ]" ]
        , a [ href "#projects", class "btn" ] [ text "[ Проекты ]" ]
        ]


introBlock : Html Msg
introBlock =
    div
        [ style "font-size" "1.15rem"
        , style "line-height" "1.7"
        , style "max-width" "62ch"
        , style "margin-bottom" "56px"
        ]
        (List.map viewParagraph bio.intro)


sectionBlock : String -> String -> List (Html Msg) -> Html Msg
sectionBlock sectionId title content =
    div [ id sectionId, style "margin-bottom" "56px" ]
        [ h2
            [ style "margin" "0 0 24px"
            , style "font-size" "0.9rem"
            , style "font-weight" "700"
            , style "text-transform" "uppercase"
            , style "letter-spacing" "0.12em"
            , style "color" "#6b6b6b"
            ]
            [ text title ]
        , div [] content
        ]


viewChapter : Content.Chapter -> Html Msg
viewChapter chapter =
    div
        [ style "display" "grid"
        , style "grid-template-columns" "150px 1fr"
        , style "gap" "10px 28px"
        , style "margin-bottom" "36px"
        ]
        [ div
            [ style "font-size" "0.9rem"
            , style "font-weight" "600"
            , style "color" "#6b6b6b"
            , style "padding-top" "4px"
            ]
            [ text chapter.period ]
        , div [ style "max-width" "62ch" ]
            [ h3
                [ style "margin" "0 0 10px"
                , style "font-size" "1.3rem"
                , style "font-weight" "600"
                , style "letter-spacing" "-0.02em"
                ]
                [ text chapter.title ]
            , div [] (List.map viewParagraph chapter.body)
            ]
        ]


viewParagraph : Paragraph -> Html Msg
viewParagraph paragraph =
    p [ style "margin" "0 0 10px" ] (List.map viewInline paragraph)


viewProjects : List Content.Project -> Html Msg
viewProjects projects =
    div
        [ style "display" "grid"
        , style "grid-template-columns" "repeat(auto-fit, minmax(280px, 1fr))"
        , style "gap" "18px"
        ]
        (List.map viewProject projects)


viewProject : Content.Project -> Html Msg
viewProject project =
    div
        [ style "border" "1px solid #e5e5e5"
        , style "border-radius" "10px"
        , style "padding" "24px"
        , style "display" "flex"
        , style "flex-direction" "column"
        , style "justify-content" "space-between"
        , style "gap" "14px"
        ]
        [ div []
            [ h3 [ style "margin" "0 0 8px", style "font-size" "1.1rem", style "font-weight" "600" ]
                [ text project.title ]
            , p [ style "margin" "0", style "font-size" "0.95rem", style "color" "#3d3d3d" ]
                [ text project.description ]
            ]
        , a
            [ href project.url
            , target "_blank"
            , rel "noreferrer"
            , class "btn"
            , style "align-self" "flex-start"
            ]
            [ text "[ Перейти ]" ]
        ]


viewInline : Content.Inline -> Html Msg
viewInline inline =
    case inline of
        Plain body ->
            text body

        Link label url_ ->
            a
                [ href url_
                , target "_blank"
                , rel "noreferrer"
                , style "color" "#3446eb"
                , style "text-decoration" "underline"
                ]
                [ text label ]


footerBlock : Html Msg
footerBlock =
    div
        [ style "margin-top" "64px"
        , style "padding-top" "28px"
        , style "border-top" "1px solid #e5e5e5"
        , style "display" "flex"
        , style "flex-wrap" "wrap"
        , style "gap" "20px"
        , style "justify-content" "space-between"
        , style "align-items" "center"
        ]
        [ div [ style "font-size" "0.95rem", style "color" "#6b6b6b" ]
            [ text "ссылки ->" ]
        , div [ style "display" "flex", style "gap" "20px", style "flex-wrap" "wrap" ]
            (List.map (\contact -> contactLink contact.label contact.url) bio.contacts)
        ]


contactLink : String -> String -> Html Msg
contactLink label url_ =
    a
        [ href url_
        , target "_blank"
        , rel "noreferrer"
        , style "color" "#111111"
        , style "text-decoration" "none"
        , style "border-bottom" "1px solid #111111"
        , style "padding-bottom" "2px"
        ]
        [ text label ]
