;; put this into profiles.clj in ~/.lein folder
{:user  {:jvm-opts ^:replace ["-Xmx6G" "-XX:-OmitStackTraceInFastThrow"]
         :repl-options {:timeout 180000}
         :plugins [[cider/cider-nrepl "0.37.0"]
                   [refactor-nrepl "3.9.0"]
                   [lein-ancient "1.0.0-RC3"]
                   [jonase/eastwood "0.3.14"]
                   [lein-try "0.4.3"]
                   [lein-cloverage "1.0.13"]
                   [lein-count "1.0.9"]
                   [lein-nvd "1.3.1"]]
         :middleware [cider-nrepl.plugin/middleware
                      refactor-nrepl.plugin/middleware]
         :dependencies [[nrepl "0.9.0"]
                        [fipp "0.6.22"]
                        [criterium "0.4.5"]
                        [org.clojure/tools.namespace "0.2.10"]]

         ,,,}}
@nxvipin
