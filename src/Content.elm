module Content exposing (Biography, Chapter, ContactLink, Inline(..), Paragraph, Project, bio)


type alias Biography =
    { title : String
    , intro : List Paragraph
    , chapters : List Chapter
    , projects : List Project
    , contacts : List ContactLink
    }


type alias ContactLink =
    { label : String
    , url : String
    }


type alias Paragraph =
    List Inline


type Inline
    = Plain String
    | Link String String


type alias Chapter =
    { period : String
    , title : String
    , body : List Paragraph
    }


type alias Project =
    { title : String
    , description : String
    , url : String
    }


bio : Biography
bio =
    { title = "k1ngmang"
    , intro =
        [ [ Plain "Привет! Я java/golang разработчик, увлекаюсь бекендом и компиляторами. " ]
        , [ Plain "" ]
        ]
    , chapters =
        [ { period = "2018 – 2020"
          , title = "Scratch и первые шаги"
          , body =
                [ [ Plain "Я начал программировать на scratch в возрасте 10 лет. Участвовал в разных мероприятиях и конкурсах, где занимал призовые места. Данный опыт помог мне понять, что такое программирование и нравится ли оно мне" ]
                ]
          }
        , { period = "2020 – 2022"
          , title = "Java и разработка игр"
          , body =
                [ [ Plain "Перешёл на java (а точнее даже на processing), но интерес к играм после скретча никуда не исчез: я продолжил их писать. Через некоторое время я смог получить первые деньги благодаря разработке на processing под заказ" ]
                ]
          }
        , { period = "2022 – 2025"
          , title = "Компиляторы и языки"
          , body =
                [ [ Plain "Меня заинтересовала разработка веб-приложений и компиляторов. Я писал интерпретаторы и компиляторы под Wiring, JVM и другие платформы, а также был мейнтейнером в сообществе "
                  , Link "TheAlgorithms" "https://github.com/TheAlgorithms"
                  , Plain " (алгоритмы на Kotlin) и создал "
                  , Link "репозиторий" "https://github.com/dlangalgorithms/algorithms"
                  , Plain " с алгоритмами на D."
                  ]
                , [ Plain "Главный проект этого периода — язык "
                  , Link "Ixion" "https://github.com/ixionlang/ixion"
                  , Plain ": статически типизированный язык с алгебраическими типами данных, который компилируется в байткод JVM. Реализовал парсер, систему типов и генерацию кода."
                  ]
                , [ Plain "Один из моих языков ("
                  , Link "Lazurite" "https://github.com/k1ngmang/lazurite"
                  , Plain ") был добавлен на платформу Gitflic, а ещё я внёс вклад в "
                  , Link "Neva" "https://github.com/nevalang/neva"
                  , Plain " (фронтенд компилятора)."
                  ]
                ]
          }
        , { period = "2025 – 2026"
          , title = "Go, движки и новые языки"
          , body =
                [ [ Plain "Летом 2025 года я начал переход с Java на Go для бэкенд-разработки. Из последних проектов — "
                  , Link "Zont" "https://github.com/k1ngmang/zont"
                  , Plain ", движок на Go, который рендерит 3D-модели прямо в консоли."
                  ]
                , [Plain "В 2025-2026 годах мне довелось поучаствовать в PROD (международная олимпиада по промышленной разработке), где я познакомился с кучей классных людей и процессами реальных it-компаний."]
                , [ Plain "Я по-прежнему интересуюсь разработкой языков программирования (в частности зависимыми типами и суперкомпиляцией), продолжаю изучать функциональное программирование, при помощи haskell, elixir и gleam, совершенствую свои скиллы в бекенде, изучаю system design. " ]
                ]
          }
        ]
    , projects =
        [ { title = "Ixion"
          , description = "Статически типизированный язык программирования с алгебраическими типами данных, компилирующийся в байткод JVM."
          , url = "https://github.com/ixionlang/ixion"
          }
        , { title = "Lazurite"
          , description = "Интерпретируемый язык программирования, в возможностью компиляции в pihta (lisp под jvm). Первый и единственный (пока что) законченный проект"
          , url = "https://github.com/k1ngmang/lazurite"
          }
        , { title = "Jasgo"
          , description = "Библиотека для генерации байт-кода jvm на golang."
          , url = "https://github.com/k1ngmang/jasgo"
          }
        , { title = "Zont"
          , description = "Движок на Go, который рендерит 3D-модели в консоли."
          , url = "https://github.com/k1ngmang/zont"
          }
        ]
    , contacts =
        [ { label = "GitHub", url = "https://github.com/k1ngmang" }
        , { label = "Telegram", url = "https://t.me/k1ngmang" }
        , { label = "LinkedIn", url = "https://www.linkedin.com/in/k1ngmang" }
        ]
    }
