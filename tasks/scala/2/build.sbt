name := "funsets"

scalaVersion := "2.13.1"

scalacOptions ++= Seq(
  "-deprecation",
  "-unchecked",
  "-optimise",
)

fork := true

javaOptions += "-Xmx2G"

parallelExecution in Test := false
