\name{Gait120_walk}
\alias{Gait120_walk}
\docType{data}
\title{
Gait120 Walking Data
}
\description{
This is a subset of the Gait120 comprhensive human locmotion and electromyography dataset.
}
\usage{data("Gait120_walk")}
\format{
  A data frame with 966 observations on the following 11 variables.
  \describe{
    \item{\code{Subject}}{Subject identifier}
    \item{\code{Trial}}{Walking trial number}
    \item{\code{Step}}{Step number within trial}
    \item{\code{Age}}{Subject age}
    \item{\code{Sex}}{Subject sex}
    \item{\code{Height (m)}}{Subject height in meters}
    \item{\code{BodyMass (kg)}}{Subject weight in kilograms}
    \item{\code{Stride_Time}}{Time take to complete the stride}
    \item{\code{Hip}}{Sagital hip kinematics of the right leg interpolated to 101 points}
    \item{\code{Knee}}{Sagital knee kinematics of the right leg interpolated to 101 points}
    \item{\code{Ankle}}{Sagital ankle kinematics of the right leg interpolated to 101 points}
  }
}
\details{
Include in this data set is saggital hip, knee, and ankle kinematics of the right leg from the level ground walking trials in the Gait120
data set. Kinetmatic signals have been interpolated to 101 point to create a common grid for functional data analysis.
Each functional observation is a single stride starting and ending with heel strike of the right leg.
Stored within the data set
is the meta data for each stride as well as each subject.
}
\source{
Original full data set is avaliable here:

https://springernature.figshare.com/articles/dataset/Comprehensive_Human_Locomotion_and_Electromyography_Dataset_Gait120/27677016
}
\references{

Boo, J., Seo, D., Kim, M. et al. Comprehensive human locomotion and electromyography dataset: Gait120. Sci Data 12, 1023 (2025). https://doi.org/10.1038/s41597-025-05391-0

}
\examples{
data(Gait120_walk)

par(mfrow = c(1,3))
matplot(t(data$Hip), main = "Hip", type = 'l', ylab = "Degrees Flexion")
matplot(t(data$Knee), main = "Knee", type = 'l', ylab = "Degrees Flexion")
matplot(t(data$Ankle), main = "Ankle", type = 'l', ylab = "Degrees Flexion")

}
\keyword{datasets}
