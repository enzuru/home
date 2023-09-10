;; put this into profiles.clj in ~/.lein folder
{:user  {:jvm-opts ^:replace ["-Xmx6G" "-XX:-OmitStackTraceInFastThrow"]
         :repl-options {:timeout 180000}
         :plugins [[cider/cider-nrepl "0.37.1"]
                   [refactor-nrepl "3.9.0"]
                   [lein-ancient "1.0.0-RC3"]
                   [jonase/eastwood "1.4.0"]
                   [lein-cloverage "1.2.4"]]
         :middleware [cider-nrepl.plugin/middleware
                      refactor-nrepl.plugin/middleware]
         :dependencies [[nrepl "1.0.0"]
                        [fipp "0.6.26"]
                        [criterium "0.4.6"]
                        [org.clojure/tools.namespace "1.4.4"]
                        [org.clojure/java.classpath "1.0.0"]]
         ,,,}}
@nxvipin
