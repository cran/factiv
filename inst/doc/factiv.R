## ----setup, echo=FALSE--------------------------------------------------------
library(knitr)
opts_chunk$set(warning = FALSE, message = FALSE)

## ----gotv_tab-----------------------------------------------------------------
library(factiv)
data(newhaven)
table(
  `In-Person` = newhaven$inperson_rand,
  `Phone` = newhaven$phone_rand
)

## ----noncomp------------------------------------------------------------------
table(
  `Phone Assignment` = newhaven$phone_rand,
  `Phone Uptake` = newhaven$phone
)

## ----finite-------------------------------------------------------------------
out <- iv_finite_factorial(turnout_98 ~ inperson + phone | inperson_rand +
                             phone_rand, data = newhaven)
summary(out)

## ----tidy---------------------------------------------------------------------
tidy(out)

## ----superpopulation----------------------------------------------------------
out_sp <- iv_factorial(turnout_98 ~ inperson + phone | inperson_rand +
                      phone_rand, data = newhaven)
summary(out_sp)

## ----sp_tidy------------------------------------------------------------------
tidy(out_sp, conf.int = TRUE)

## ----compliance_profile-------------------------------------------------------
cov_prof <- compliance_profile(
  ~ inperson + phone | inperson_rand + phone_rand |
    age + maj_party + turnout_96,
  data = newhaven)
cov_prof

