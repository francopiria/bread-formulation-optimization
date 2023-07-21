# The goal is to optimize the formulation of a gluten-free bread. As a first
# step, we will conduct a screening design to identify the variables that have
# the most significant effect on the bread's dryness. We start with six
# variables, corresponding to the concentrations of the following ingredients:
# xanthan gum, guar gum, hydroxyethyl cellulose, albumin, amylase, and ascorbic
# acid. I will generate the most suitable experimental design in R and provide
# the experimental conditions to be evaluated (design matrix). I'll also
# consider the design's resolution and the confounded effects.

# Since this is an exploratory analysis, and there are many variables to
# evaluate, I would suggest using a fractional two-level design for each
# variable to avoid testing an excessively large number of experimental
# conditions. The dependent variable will be the bread's dryness, which will
# be evaluated sensorially by a panel of trained judges.

# A full factorial design with six factors would involve a total of 64
# conditions. However, for this exploratory study, it is more relevant to
# examine the main effects and first-order interactions (one-to-one). With six
# factors, there will be six main effects and 15 first-order interactions,
# making a total of 21 effects of interest. The closest complete designs would
# be 2^(4) and 2^(5). Although a 2^(6-1) design would provide more and better
# information, 32 conditions still seem like a lot for this stage. I believe
# it's best to start with a 2^(6-2) design, dividing the design into 4 blocks,
# resulting in a total of 16 conditions—a much more manageable number for the
# screening.

# This design has a resolution of 4, which means that the main effects are not
# confounded with any other main effects, but first-order interaction effect
# may be confounded with each other. Despite this limitation, I still think it
# is the best option as it allows for quickly discarding irrelevant factors.
# Subsequently, we can generate a complete and replicated design (but with fewer
# factors) to study if the interactions are significant.

# (First I install the FrF2 libriary)


library(FrF2)
dis.ej1 <- FrF2(nfactors = 6, resolution = 4)
summary(dis.ej1)

# The design matrix in random conditions to minimize bias is generated
# The confounded effects are AB=CE=DF AC=BE AD=BF AE=BC AF=BD CD=EF and CF=DE
# No first order effects are confounded in this design.

