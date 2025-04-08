---
layout: post
title: Regression Analysis
date: 2014-05-11
categories: [computer science]
tags: [machine learning]

---


## Article Source
* Title: [Regression Analysis](http://en.wikipedia.org/wiki/Regression_analysis)
* Authors: Wikipedia, the free encyclopedia

[![](http://sungsoo.github.com/images/regression-analysis.png)](http://sungsoo.github.com/images/regression-analysis.png)

# Regression Analysis

회귀분석(回歸分析, regression analysis)은 통계학에서 관찰된 연속형 변수들에 대해 독립변수와 종속변수 사이의 상관관계에 따른 수학적 모델인 선형적 관계식을 구하여 어떤 독립변수가 주어졌을 때 이에 따른 종속변수를 예측한다. 또한 이 수학적 모델이 얼마나 잘 설명하고 있는지를 판별하기 위한 적합도를 측정하는 분석 방법이다.

1개의 종속변수와 1개의 독립변수 사이의 관계를 분석할 경우를 단순회귀분석(Simple Regression Analysis), 1개의 종속변수와 여러 개의 독립변수 사이의 관계를 규명하고자 할 경우를 다중회귀분석(Multiple Regression Analysis)이라고 한다.

회귀분석은 시간에 따라 변화하는 데이터나 어떤 영향, 가설적 실험, 인과관계의 모델링등의 통계적 예측에 이용될 수 있다. 그러나 많은 경우 가정이 맞는지 아닌지 적절하게 밝혀지지 않은 채로 이용되어 그 결과가 오용되는 경우도 있다. 특히 통계소프트웨어의 발달로 분석이 용이해져서 결과를 쉽게 얻을 수 있지만 적절한 분석방법의 선택이였는지 또한 정확한 정보분석인지 판단하는 것은 연구자에 달려 있다.


----

In [statistics](http://en.wikipedia.org/wiki/Statistics "Statistics"), **regression analysis**
is a statistical process for estimating the relationships among
variables. It includes many techniques for modeling and analyzing
several variables, when the focus is on the relationship between a
[dependent variable](http://en.wikipedia.org/wiki/Dependent_variable "Dependent variable") and
one or more [independent
variables](http://en.wikipedia.org/wiki/Independent_variable "Independent variable"). More
specifically, regression analysis helps one understand how the typical
value of the dependent variable (or 'criterion variable') changes when
any one of the independent variables is varied, while the other
independent variables are held fixed. Most commonly, regression analysis
estimates the [conditional
expectation](http://en.wikipedia.org/wiki/Conditional_expectation "Conditional expectation") of
the dependent variable given the independent variables – that is, the
[average value](http://en.wikipedia.org/wiki/Average_value "Average value") of the dependent
variable when the independent variables are fixed. Less commonly, the
focus is on a [quantile](http://en.wikipedia.org/wiki/Quantile "Quantile"), or other [location
parameter](http://en.wikipedia.org/wiki/Location_parameter "Location parameter") of the
conditional distribution of the dependent variable given the independent
variables. In all cases, the estimation target is a
[function](http://en.wikipedia.org/wiki/Function_(mathematics) "Function (mathematics)") of the
independent variables called the **regression function**. In regression
analysis, it is also of interest to characterize the variation of the
dependent variable around the regression function which can be described
by a [probability
distribution](http://en.wikipedia.org/wiki/Probability_distribution "Probability distribution").

Regression analysis is widely used for
[prediction](http://en.wikipedia.org/wiki/Prediction "Prediction") and
[forecasting](http://en.wikipedia.org/wiki/Forecasting "Forecasting"), where its use has
substantial overlap with the field of [machine
learning](http://en.wikipedia.org/wiki/Machine_learning "Machine learning"). Regression
analysis is also used to understand which among the independent
variables are related to the dependent variable, and to explore the
forms of these relationships. In restricted circumstances, regression
analysis can be used to infer [causal
relationships](http://en.wikipedia.org/wiki/Causality "Causality") between the independent and
dependent variables. However this can lead to illusions or false
relationships, so caution is advisable;[[1]](http://en.wikipedia.org/wiki/Regression_analysis#cite_note1) for
example, [correlation does not imply
causation](http://en.wikipedia.org/wiki/Correlation_does_not_imply_causation "Correlation does not imply causation").

Many techniques for carrying out regression analysis have been
developed. Familiar methods such as [linear
regression](http://en.wikipedia.org/wiki/Linear_regression "Linear regression") and [ordinary
least squares](http://en.wikipedia.org/wiki/Ordinary_least_squares "Ordinary least squares")
regression are
[parametric](http://en.wikipedia.org/wiki/Parametric_statistics "Parametric statistics"), in
that the regression function is defined in terms of a finite number of
unknown [parameters](http://en.wikipedia.org/wiki/Parameter "Parameter") that are estimated
from the [data](http://en.wikipedia.org/wiki/Data "Data"). [Nonparametric
regression](http://en.wikipedia.org/wiki/Nonparametric_regression "Nonparametric regression")
refers to techniques that allow the regression function to lie in a
specified set of
[functions](http://en.wikipedia.org/wiki/Function_(mathematics) "Function (mathematics)"),
which may be [infinitedimensional](http://en.wikipedia.org/wiki/Dimension "Dimension").

The performance of regression analysis methods in practice depends on
the form of the [data generating
process](http://en.wikipedia.org/wiki/Data_generating_process "Data generating process"), and
how it relates to the regression approach being used. Since the true
form of the datagenerating process is generally not known, regression
analysis often depends to some extent on making assumptions about this
process. These assumptions are sometimes testable if a sufficient
quantity of data is available. Regression models for prediction are
often useful even when the assumptions are moderately violated, although
they may not perform optimally. However, in many applications,
especially with small [effects](http://en.wikipedia.org/wiki/Effect_size "Effect size") or
questions of [causality](http://en.wikipedia.org/wiki/Causality "Causality") based on
[observational data](http://en.wikipedia.org/wiki/Observational_study "Observational study"),
regression methods can give misleading
results.[[2]](http://en.wikipedia.org/wiki/Regression_analysis#cite_note2)[[3]](http://en.wikipedia.org/wiki/Regression_analysis#cite_note3)



# History

회귀(Regress)의 원래 의미는 옛날 상태로 돌아가는 것을 의미한다. 영국의 유전학자 프란시스 갈튼(Francis Galton)은 부모의 키와 아이들의 키 사이의 연관 관계를 연구하면서 부모와 자녀의 키사이에는 선형적인 관계가 있고 키가 커지거나 작아지는 것보다는 전체 키 평균으로 돌아가려는 경향이 있다는 가설을 세웠으며 이를 분석하는 방법을 "회귀분석"이라고 하였다. 이러한 경험 적 연구 후에 칼 피어슨(Karl Pearson)은 아버지와 아들의 키를 조사한 결과를 바탕으로 함수 관계를 도출하여 수학적 전개를 정립하였다

---

The earliest form of regression was the [method of least
squares](http://en.wikipedia.org/wiki/Method_of_least_squares "Method of least squares"), which
was published by
[Legendre](http://en.wikipedia.org/wiki/Adrien_Marie_Legendre "Adrien Marie Legendre") in
1805,[[4]](http://en.wikipedia.org/wiki/Regression_analysis#cite_noteLegendre4) and by
[Gauss](http://en.wikipedia.org/wiki/Carl_Friedrich_Gauss "Carl Friedrich Gauss") in
1809.[[5]](http://en.wikipedia.org/wiki/Regression_analysis#cite_noteGauss5) Legendre and Gauss both applied the
method to the problem of determining, from astronomical observations,
the orbits of bodies about the Sun (mostly comets, but also later the
then newly discovered minor planets). Gauss published a further
development of the theory of least squares in
1821,[[6]](http://en.wikipedia.org/wiki/Regression_analysis#cite_noteGauss26) including a version of the
[Gauss–Markov
theorem](http://en.wikipedia.org/wiki/Gauss%E2%80%93Markov_theorem "Gauss–Markov theorem").

The term "regression" was coined by [Francis
Galton](http://en.wikipedia.org/wiki/Francis_Galton "Francis Galton") in the nineteenth century
to describe a biological phenomenon. The phenomenon was that the heights
of descendants of tall ancestors tend to regress down towards a normal
average (a phenomenon also known as [regression toward the
mean](http://en.wikipedia.org/wiki/Regression_toward_the_mean "Regression toward the mean")).[[7]](http://en.wikipedia.org/wiki/Regression_analysis#cite_note7)[[8]](http://en.wikipedia.org/wiki/Regression_analysis#cite_note8)
For Galton, regression had only this biological
meaning,[[9]](http://en.wikipedia.org/wiki/Regression_analysis#cite_note9)[[10]](http://en.wikipedia.org/wiki/Regression_analysis#cite_note10) but his work was
later extended by [Udny Yule](http://en.wikipedia.org/wiki/Udny_Yule "Udny Yule") and [Karl
Pearson](http://en.wikipedia.org/wiki/Karl_Pearson "Karl Pearson") to a more general
statistical context.[[11]](http://en.wikipedia.org/wiki/Regression_analysis#cite_note11)[[12]](http://en.wikipedia.org/wiki/Regression_analysis#cite_note12) In
the work of Yule and Pearson, the joint distribution of the response and
explanatory variables is assumed to be
[Gaussian](http://en.wikipedia.org/wiki/Normal_distribution "Normal distribution"). This
assumption was weakened by [R.A.
Fisher](http://en.wikipedia.org/wiki/Ronald_A._Fisher "Ronald A. Fisher") in his works of 1922
and
1925.[[13]](http://en.wikipedia.org/wiki/Regression_analysis#cite_note13)[[14]](http://en.wikipedia.org/wiki/Regression_analysis#cite_noteFisherR1954Statistical14)[[15]](http://en.wikipedia.org/wiki/Regression_analysis#cite_note15)
Fisher assumed that the conditional distribution of the response
variable is Gaussian, but the joint distribution need not be. In this
respect, Fisher's assumption is closer to Gauss's formulation of 1821.

In the 1950s and 1960s, economists used electromechanical desk
calculators to calculate regressions. Before 1970, it sometimes took up
to 24 hours to receive the result from one
regression.[[16]](http://en.wikipedia.org/wiki/Regression_analysis#cite_note16)

Regression methods continue to be an area of active research. In recent
decades, new methods have been developed for [robust
regression](http://en.wikipedia.org/wiki/Robust_regression "Robust regression"), regression
involving correlated responses such as [time
series](http://en.wikipedia.org/wiki/Time_series "Time series") and [growth
curves](http://en.wikipedia.org/wiki/Growth_curves "Growth curves"), regression in which the
predictor or response variables are curves, images, graphs, or other
complex data objects, regression methods accommodating various types of
missing data, [nonparametric
regression](http://en.wikipedia.org/wiki/Nonparametric_regression "Nonparametric regression"),
[Bayesian](http://en.wikipedia.org/wiki/Bayesian_statistics "Bayesian statistics") methods for
regression, regression in which the predictor variables are measured
with error, regression with more predictor variables than observations,
and causal inference with regression.

## 회귀분석의 표준 가정

회귀분석은 다음의 가정을 바탕으로 한다.

1. 잔차(Residuals)는 모든 독립변수 값에 대하여 동일한 분산을 갖는다.
2. 잔차의 평균은 0이다.
3. 수집된 데이터의 분산은 정규분포를 이루고 있다.
4. 독립변수 상호간에는 상관관계가 없어야 한다.
5. 시간에 따라 수집한 데이터들은 잡음의 영향을 받지 않아야 한다.

독립변수들간에 상관관계가 나타나는 경우 다중공선성문제라고 한다.

## 회귀모형 적합도
회귀모형이 적합한지 확인하기 위해 결정계수 *R<sup>2</sup>*을 사용한다. 이는 회귀모형의 독립변수가 종속변수 변동의 몇%를 설명하고 있는지를 나타내는 지표이다.

# Regression models


Regression models involve the following variables:

   The **unknown parameters**, denoted as **β**, which may represent a
    [scalar](http://en.wikipedia.org/wiki/Scalar_(physics) "Scalar (physics)") or a
    [vector](http://en.wikipedia.org/wiki/Euclidean_vector "Euclidean vector").
   The **independent variables**, **X**.
   The **dependent variable**, *Y*.

In various [fields of
application](http://en.wikipedia.org/wiki/List_of_fields_of_application_of_statistics "List of fields of application of statistics"),
different terminologies are used in place of [dependent and independent
variables](http://en.wikipedia.org/wiki/Dependent_and_independent_variables "Dependent and independent variables").

A regression model relates *Y* to a function of **X** and **β**.

![Y \\approx f (\\mathbf {X}, \\boldsymbol{\\beta}
)](http://upload.wikimedia.org/math/9/7/c/97ccc062c15e6accc11fd274da6d5fc0.png)

The approximation is usually formalized as *E*(*Y* | **X**) = *f*(**X**,
**β**). To carry out regression analysis, the form of the function *f*
must be specified. Sometimes the form of this function is based on
knowledge about the relationship between *Y* and **X** that does not
rely on the data. If no such knowledge is available, a flexible or
convenient form for *f* is chosen.

Assume now that the vector of unknown parameters **β** is of length *k*.
In order to perform a regression analysis the user must provide
information about the dependent variable *Y*:

   If *N* data points of the form (*Y*, **X**) are observed, where *N*
    \< *k*, most classical approaches to regression analysis cannot be
    performed: since the system of equations defining the regression
    model is underdetermined, there are not enough data to recover
    **β**.
   If exactly *N* = *k* data points are observed, and the function *f*
    is linear, the equations *Y* = *f*(**X**, **β**) can be solved
    exactly rather than approximately. This reduces to solving a set of
    *N* equations with *N* unknowns (the elements of **β**), which has a
    unique solution as long as the **X** are linearly independent. If
    *f* is nonlinear, a solution may not exist, or many solutions may
    exist.
   The most common situation is where *N* \> *k* data points are
    observed. In this case, there is enough information in the data to
    estimate a unique value for **β** that best fits the data in some
    sense, and the regression model when applied to the data can be
    viewed as an [overdetermined
    system](http://en.wikipedia.org/wiki/Overdetermined_system "Overdetermined system") in
    **β**.

In the last case, the regression analysis provides the tools for:

1.  Finding a solution for unknown parameters **β** that will, for
    example, minimize the distance between the measured and predicted
    values of the dependent variable *Y* (also known as method of [least
    squares](http://en.wikipedia.org/wiki/Least_squares "Least squares")).
2.  Under certain statistical assumptions, the regression analysis uses
    the surplus of information to provide statistical information about
    the unknown parameters **β** and predicted values of the dependent
    variable *Y*.

# Necessary number of independent measurements

Consider a regression model which has three unknown parameters, β~0~,
β~1~, and β~2~. Suppose an experimenter performs 10 measurements all at
exactly the same value of independent variable vector **X** (which
contains the independent variables *X*~1~, *X*~2~, and *X*~3~). In this
case, regression analysis fails to give a unique set of estimated values
for the three unknown parameters; the experimenter did not provide
enough information. The best one can do is to estimate the average value
and the standard deviation of the dependent variable *Y*. Similarly,
measuring at two different values of **X** would give enough data for a
regression with two unknowns, but not for three or more unknowns.

If the experimenter had performed measurements at three different values
of the independent variable vector **X**, then regression analysis would
provide a unique set of estimates for the three unknown parameters in
**β**.

In the case of [general linear
regression](http://en.wikipedia.org/wiki/Regression_analysis#Linear_regression "Regression analysis"),
the above statement is equivalent to the requirement that the matrix
**X**T**X** is
[invertible](http://en.wikipedia.org/wiki/Invertible_matrix "Invertible matrix").

# Statistical assumptions

When the number of measurements, *N*, is larger than the number of
unknown parameters, *k*, and the measurement errors ε~i~ are normally
distributed then *the excess of information* contained in (*N* − *k*)
measurements is used to make statistical predictions about the unknown
parameters. This excess of information is referred to as the [degrees of
freedom](http://en.wikipedia.org/wiki/Degrees_of_freedom_(statistics)#Linear_regression "Degrees of freedom (statistics)")
of the regression.

# Underlying assumptions


Classical [assumptions](http://en.wikipedia.org/wiki/Statistical_assumption "Statistical assumption") for
regression analysis include:

   The sample is representative of the population for the inference
    prediction.
   The error is a [random
    variable](http://en.wikipedia.org/wiki/Random_variable "Random variable") with a mean of
    zero conditional on the explanatory variables.
   The independent variables are measured with no error. (Note: If this
    is not so, modeling may be done instead using [errorsinvariables
    model](http://en.wikipedia.org/wiki/Errorsinvariables_model "Errorsinvariables model")
    techniques).
   The predictors are [linearly
    independent](http://en.wikipedia.org/wiki/Linearly_independent "Linearly independent"),
    i.e. it is not possible to express any predictor as a linear
    combination of the others.
   The errors are [uncorrelated](http://en.wikipedia.org/wiki/Uncorrelated "Uncorrelated"),
    that is, the [variance–covariance
    matrix](http://en.wikipedia.org/wiki/Covariance_matrix "Covariance matrix") of the errors
    is [diagonal](http://en.wikipedia.org/wiki/Diagonal_matrix "Diagonal matrix") and each
    nonzero element is the variance of the error.
   The variance of the error is constant across observations
    ([homoscedasticity](http://en.wikipedia.org/wiki/Homoscedasticity "Homoscedasticity")). If
    not, [weighted least
    squares](http://en.wikipedia.org/wiki/Weighted_least_squares "Weighted least squares") or
    other methods might instead be used.

These are sufficient conditions for the leastsquares estimator to
possess desirable properties; in particular, these assumptions imply
that the parameter estimates will be
[unbiased](http://en.wikipedia.org/wiki/Bias_of_an_estimator "Bias of an estimator"),
[consistent](http://en.wikipedia.org/wiki/Consistent_estimator "Consistent estimator"), and
[efficient](http://en.wikipedia.org/wiki/Efficient_(statistics) "Efficient (statistics)") in
the class of linear unbiased estimators. It is important to note that
actual data rarely satisfies the assumptions. That is, the method is
used even though the assumptions are not true. Variation from the
assumptions can sometimes be used as a measure of how far the model is
from being useful. Many of these assumptions may be relaxed in more
advanced treatments. Reports of statistical analyses usually include
analyses of tests on the sample data and methodology for the fit and
usefulness of the model.

Assumptions include the geometrical support of the
variables.[[17]](http://en.wikipedia.org/wiki/Regression_analysis#cite_note17)[*[clarification\\ needed](http://en.wikipedia.org/wiki/Wikipedia:Please_clarify "Wikipedia:Please clarify")*]
Independent and dependent variables often refer to values measured at
point locations. There may be spatial trends and spatial autocorrelation
in the variables that violate statistical assumptions of regression.
Geographic weighted regression is one technique to deal with such
data.[[18]](http://en.wikipedia.org/wiki/Regression_analysis#cite_note18) Also, variables may include values
aggregated by areas. With aggregated data the [modifiable areal unit
problem](http://en.wikipedia.org/wiki/Modifiable_areal_unit_problem "Modifiable areal unit problem")
can cause extreme variation in regression
parameters.[[19]](http://en.wikipedia.org/wiki/Regression_analysis#cite_note19) When analyzing data aggregated by
political boundaries, postal codes or census areas results may be very
distinct with a different choice of units.

# Linear regression


Main article: [Linear
regression](http://en.wikipedia.org/wiki/Linear_regression "Linear regression")

See [simple linear
regression](http://en.wikipedia.org/wiki/Simple_linear_regression "Simple linear regression")
for a derivation of these formulas and a numerical example

In linear regression, the model specification is that the dependent
variable, ![ y\_i
](http://upload.wikimedia.org/math/1/8/d/18daef71b5d25ce76b8628a81e4fc76b.png)
is a [linear combination](http://en.wikipedia.org/wiki/Linear_combination "Linear combination")
of the *parameters* (but need not be linear in the *independent
variables*). For example, in [simple linear
regression](http://en.wikipedia.org/wiki/Simple_linear_regression "Simple linear regression")
for modeling ![ n
](http://upload.wikimedia.org/math/7/b/8/7b8b965ad4bca0e41ab51de7b31363a1.png)
data points there is one independent variable: ![ x\_i
](http://upload.wikimedia.org/math/0/5/e/05e42209d67fe1eb15a055e9d3b3770e.png),
and two parameters,
![\\beta\_0](http://upload.wikimedia.org/math/c/1/3/c136880f2a422a2c9341214e2a694a51.png)
and
![\\beta\_1](http://upload.wikimedia.org/math/9/f/2/9f26b68b727cdcf2c659189280f6ce55.png):

straight line: ![y\_i=\\beta\_0 +\\beta\_1 x\_i +\\varepsilon\_i,\\quad
i=1,\\dots,n.\\!](http://upload.wikimedia.org/math/4/c/2/4c29c4619b22317dc895ed5216ad9d52.png)

In multiple linear regression, there are several independent variables
or functions of independent variables.

Adding a term in *x~i~*2 to the preceding regression gives:

parabola: ![y\_i=\\beta\_0 +\\beta\_1 x\_i +\\beta\_2
x\_i\2+\\varepsilon\_i,\\
i=1,\\dots,n.\\!](http://upload.wikimedia.org/math/c/f/5/cf5ec5eb13985adc18339573babd8fdf.png)

This is still linear regression; although the expression on the right
hand side is quadratic in the independent variable
![x\_i](http://upload.wikimedia.org/math/0/5/e/05e42209d67fe1eb15a055e9d3b3770e.png),
it is linear in the parameters
![\\beta\_0](http://upload.wikimedia.org/math/c/1/3/c136880f2a422a2c9341214e2a694a51.png),
![\\beta\_1](http://upload.wikimedia.org/math/9/f/2/9f26b68b727cdcf2c659189280f6ce55.png)
and
![\\beta\_2.](http://upload.wikimedia.org/math/f/e/1/fe1e69a8f3ece3d28b4f615d12f2f66c.png)

In both cases,
![\\varepsilon\_i](http://upload.wikimedia.org/math/0/f/4/0f47d03c4ec209af985b83fce1fd121e.png)
is an error term and the subscript
![i](http://upload.wikimedia.org/math/8/6/5/865c0c0b4ab0e063e5caa3387c1a8741.png)
indexes a particular observation.

Given a random sample from the population, we estimate the population
parameters and obtain the sample linear regression model:

![ \\widehat{y\_i} = \\widehat{\\beta}\_0 + \\widehat{\\beta}\_1 x\_i.
](http://upload.wikimedia.org/math/b/3/f/b3f714ffd61c8d37aba30d96545a3e60.png)

The
[residual](http://en.wikipedia.org/wiki/Errors_and_residuals_in_statistics "Errors and residuals in statistics"),
![ e\_i = y\_i  \\widehat{y}\_i
](http://upload.wikimedia.org/math/9/f/1/9f118e59309bb88414d83f287e372e1e.png),
is the difference between the value of the dependent variable predicted
by the model, ![
\\widehat{y\_i}](http://upload.wikimedia.org/math/0/1/f/01f723b8bb6d1e0ca323f5dbc665bf68.png),
and the true value of the dependent variable,
![y\_i](http://upload.wikimedia.org/math/1/8/d/18daef71b5d25ce76b8628a81e4fc76b.png).
One method of estimation is [ordinary least
squares](http://en.wikipedia.org/wiki/Ordinary_least_squares "Ordinary least squares"). This
method obtains parameter estimates that minimize the sum of squared
[residuals](http://en.wikipedia.org/wiki/Errors_and_residuals_in_statistics "Errors and residuals in statistics"),
SSE,[[20]](http://en.wikipedia.org/wiki/Regression_analysis#cite_note20)[[21]](http://en.wikipedia.org/wiki/Regression_analysis#cite_note21) also sometimes
denoted [RSS](http://en.wikipedia.org/wiki/Residual_sum_of_squares "Residual sum of squares"):

![SSE=\\sum\_{i=1}\n e\_i\2. \\,
](http://upload.wikimedia.org/math/1/8/f/18f545c01d6c3190e7af31a730cc3b4a.png)

Minimization of this function results in a set of [normal
equations](http://en.wikipedia.org/wiki/Linear_least_squares_(mathematics) "Linear least squares (mathematics)"),
a set of simultaneous linear equations in the parameters, which are
solved to yield the parameter estimators, ![\\widehat{\\beta}\_0,
\\widehat{\\beta}\_1](http://upload.wikimedia.org/math/5/8/b/58bd4a9496d8ed0c8b6008797283aaf0.png).

In the case of simple regression, the formulas for the least squares
estimates are

![\\widehat{\\beta\_1}=\\frac{\\sum(x\_i\\bar{x})(y\_i\\bar{y})}{\\sum(x\_i\\bar{x})\2}\\text{
and
}\\hat{\\beta\_0}=\\bar{y}\\widehat{\\beta\_1}\\bar{x}](http://upload.wikimedia.org/math/b/d/4/bd4e68ff43f15d3a771e51ac598abadc.png)

where
![\\bar{x}](http://upload.wikimedia.org/math/8/4/7/84790e2b15a305120bc3fbeb4a4eeb4f.png)
is the [mean](http://en.wikipedia.org/wiki/Arithmetic_mean "Arithmetic mean") (average) of the
![x](http://upload.wikimedia.org/math/9/d/d/9dd4e461268c8034f5c8564e155c67a6.png)
values and
![\\bar{y}](http://upload.wikimedia.org/math/1/0/b/10b9fdacffcecc3574e9306610427486.png)
is the mean of the
![y](http://upload.wikimedia.org/math/4/1/5/415290769594460e2e485922904f345d.png)
values.

Under the assumption that the population error term has a constant
variance, the estimate of that variance is given by:

![ \\hat{\\sigma}\2\_\\varepsilon =
\\frac{SSE}{n2}.\\,](http://upload.wikimedia.org/math/4/e/4/4e4edc15e25f5713548e2136ca1d8d33.png)

This is called the [mean square
error](http://en.wikipedia.org/wiki/Mean_square_error "Mean square error") (MSE) of the
regression. The denominator is the sample size reduced by the number of
model parameters estimated from the same data, (*n**p*) for *p*
[regressors](http://en.wikipedia.org/wiki/Regressor "Regressor") or (*n**p*1) if an intercept
is used.[[22]](http://en.wikipedia.org/wiki/Regression_analysis#cite_note22) In this case, *p*=1 so the denominator
is *n*2.

The [standard
errors](http://en.wikipedia.org/wiki/Standard_error_(statistics) "Standard error (statistics)")
of the parameter estimates are given by

![\\hat\\sigma\_{\\beta\_0}=\\hat\\sigma\_{\\varepsilon}
\\sqrt{\\frac{1}{n} + \\frac{\\bar{x}\2}{\\sum(x\_i\\bar
x)\2}}](http://upload.wikimedia.org/math/b/d/4/bd4e68ff43f15d3a771e51ac598abadc.png)

![\\hat\\sigma\_{\\beta\_1}=\\hat\\sigma\_{\\varepsilon}
\\sqrt{\\frac{1}{\\sum(x\_i\\bar
x)\2}}.](http://upload.wikimedia.org/math/f/8/d/f8d7fac226210b447148f7cef1e5cd69.png)

Under the further assumption that the population error term is normally
distributed, the researcher can use these estimated standard errors to
create [confidence
intervals](http://en.wikipedia.org/wiki/Confidence_interval "Confidence interval") and conduct
[hypothesis tests](http://en.wikipedia.org/wiki/Hypothesis_test "Hypothesis test") about the
[population
parameters](http://en.wikipedia.org/wiki/Population_parameter "Population parameter").

# General linear model

For a derivation, see [linear least
squares](http://en.wikipedia.org/wiki/Linear_least_squares_(mathematics) "Linear least squares (mathematics)")

For a numerical example, see [linear
regression](http://en.wikipedia.org/wiki/Linear_regression "Linear regression")

In the more general multiple regression model, there are *p* independent
variables:

![ y\_i = \\beta\_1 x\_{i1} + \\beta\_2 x\_{i2} + \\cdots + \\beta\_p
x\_{ip} + \\varepsilon\_i, \\,
](http://upload.wikimedia.org/math/c/7/4/c74fd917c40a07d46a7839bc3456b628.png)

where *x~ij~* is the *i*th observation on the *j*th independent
variable, and where the first independent variable takes the value 1 for
all *i* (so
![\\beta\_1](http://upload.wikimedia.org/math/9/f/2/9f26b68b727cdcf2c659189280f6ce55.png)
is the regression intercept).

The least squares parameter estimates are obtained from *p* normal
equations. The residual can be written as

![\\varepsilon\_i=y\_i  \\hat\\beta\_1 x\_{i1}  \\cdots 
\\hat\\beta\_p
x\_{ip}.](http://upload.wikimedia.org/math/c/8/4/c843bc10f9bc7d223d5d7f140eea3e24.png)

The **normal equations** are

![\\sum\_{i=1}\n \\sum\_{k=1}\p X\_{ij}X\_{ik}\\hat
\\beta\_k=\\sum\_{i=1}\n X\_{ij}y\_i,\\
j=1,\\dots,p.\\,](http://upload.wikimedia.org/math/2/7/3/27309d662588e1f67b2d2dd391706323.png)

In matrix notation, the normal equations are written as

![\\mathbf{(X\\\top X )\\hat{\\boldsymbol{\\beta}}= {}X\\\top
Y},\\,](http://upload.wikimedia.org/math/5/7/0/57095b3dddf9c15a67754cfc09f43b58.png)

where the *ij* element of *X* is *x~ij~*, the *i* element of the column
vector *Y* is *y~i~*, and the *j* element of ![\\hat
\\beta](http://upload.wikimedia.org/math/5/9/7/59744f666ff56f695bfe4d128a6784f4.png)
is ![\\hat
\\beta\_j](http://upload.wikimedia.org/math/1/e/c/1ecd31209910743efdb275c29ebd0d5a.png).
Thus *X* is *n*×*p*, *Y* is *n*×1, and ![\\hat
\\beta](http://upload.wikimedia.org/math/5/9/7/59744f666ff56f695bfe4d128a6784f4.png)
is *p*×1. The solution is

![\\mathbf{\\hat{\\boldsymbol{\\beta}}= {}(X\\\top X )\{1}X\\\top
Y}.\\,](http://upload.wikimedia.org/math/3/f/2/3f2afe078dfbcc2f626ad09956cd691a.png)

# Diagnostics

See also category: [Regression
diagnostics](http://en.wikipedia.org/wiki/Category:Regression_diagnostics "Category:Regression diagnostics")

Once a regression model has been constructed, it may be important to
confirm the [goodness of fit](http://en.wikipedia.org/wiki/Goodness_of_fit "Goodness of fit")
of the model and the [statistical
significance](http://en.wikipedia.org/wiki/Statistical_significance "Statistical significance")
of the estimated parameters. Commonly used checks of goodness of fit
include the [Rsquared](http://en.wikipedia.org/wiki/Rsquared "Rsquared"), analyses of the
pattern of
[residuals](http://en.wikipedia.org/wiki/Errors_and_residuals_in_statistics "Errors and residuals in statistics")
and hypothesis testing. Statistical significance can be checked by an
[Ftest](http://en.wikipedia.org/wiki/Ftest "Ftest") of the overall fit, followed by
[ttests](http://en.wikipedia.org/wiki/Ttest "Ttest") of individual parameters.

Interpretations of these diagnostic tests rest heavily on the model
assumptions. Although examination of the residuals can be used to
invalidate a model, the results of a [ttest](http://en.wikipedia.org/wiki/Ttest "Ttest") or
[Ftest](http://en.wikipedia.org/wiki/Ftest "Ftest") are sometimes more difficult to
interpret if the model's assumptions are violated. For example, if the
error term does not have a normal distribution, in small samples the
estimated parameters will not follow normal distributions and complicate
inference. With relatively large samples, however, a [central limit
theorem](http://en.wikipedia.org/wiki/Central_limit_theorem "Central limit theorem") can be
invoked such that hypothesis testing may proceed using asymptotic
approximations.

# "Limited dependent" variables

The phrase "limited dependent" is used in
[econometric](http://en.wikipedia.org/wiki/Econometric "Econometric") statistics for
categorical and constrained variables.

The response variable may be noncontinuous ("limited" to lie on some
subset of the real line). For binary (zero or one) variables, if
analysis proceeds with leastsquares linear regression, the model is
called the [linear probability
model](http://en.wikipedia.org/wiki/Linear_probability_model "Linear probability model").
Nonlinear models for binary dependent variables include the
[probit](http://en.wikipedia.org/wiki/Probit_model "Probit model") and [logit
model](http://en.wikipedia.org/wiki/Logistic_regression "Logistic regression"). The
[multivariate probit](http://en.wikipedia.org/wiki/Multivariate_probit "Multivariate probit")
model is a standard method of estimating a joint relationship between
several binary dependent variables and some independent variables. For
[categorical
variables](http://en.wikipedia.org/wiki/Categorical_variable "Categorical variable") with more
than two values there is the [multinomial
logit](http://en.wikipedia.org/wiki/Multinomial_logit "Multinomial logit"). For [ordinal
variables](http://en.wikipedia.org/wiki/Ordinal_variable "Ordinal variable") with more than two
values, there are the [ordered
logit](http://en.wikipedia.org/wiki/Ordered_logit "Ordered logit") and [ordered
probit](http://en.wikipedia.org/wiki/Ordered_probit "Ordered probit") models. [Censored
regression
models](http://en.wikipedia.org/wiki/Censored_regression_model "Censored regression model") may
be used when the dependent variable is only sometimes observed, and
[Heckman correction](http://en.wikipedia.org/wiki/Heckman_correction "Heckman correction") type
models may be used when the sample is not randomly selected from the
population of interest. An alternative to such procedures is linear
regression based on [polychoric
correlation](http://en.wikipedia.org/wiki/Polychoric_correlation "Polychoric correlation") (or
polyserial correlations) between the categorical variables. Such
procedures differ in the assumptions made about the distribution of the
variables in the population. If the variable is positive with low values
and represents the repetition of the occurrence of an event, then count
models like the [Poisson
regression](http://en.wikipedia.org/wiki/Poisson_regression "Poisson regression") or the
[negative binomial](http://en.wikipedia.org/wiki/Negative_binomial "Negative binomial") model
may be used instead.

## Interpolation and extrapolation

Regression models predict a value of the *Y* variable given known values
of the *X* variables. Prediction *within* the range of values in the
dataset used for modelfitting is known informally as
[interpolation](http://en.wikipedia.org/wiki/Interpolation "Interpolation"). Prediction
*outside* this range of the data is known as
[extrapolation](http://en.wikipedia.org/wiki/Extrapolation "Extrapolation"). Performing
extrapolation relies strongly on the regression assumptions. The further
the extrapolation goes outside the data, the more room there is for the
model to fail due to differences between the assumptions and the sample
data or the true values.

It is generally
advised[*[citation\\ needed](http://en.wikipedia.org/wiki/Wikipedia:Citation_needed "Wikipedia:Citation needed")*]
that when performing extrapolation, one should accompany the estimated
value of the dependent variable with a prediction interval that
represents the uncertainty. Such intervals tend to expand rapidly as the
values of the independent variable(s) moved outside the range covered by
the observed data.

For such reasons and others, some tend to say that it might be unwise to
undertake extrapolation.[[23]](http://en.wikipedia.org/wiki/Regression_analysis#cite_note23)

However, this does not cover the full set of modelling errors that may
be being made: in particular, the assumption of a particular form for
the relation between *Y* and *X*. A properly conducted regression
analysis will include an assessment of how well the assumed form is
matched by the observed data, but it can only do so within the range of
values of the independent variables actually available. This means that
any extrapolation is particularly reliant on the assumptions being made
about the structural form of the regression relationship. Bestpractice
advice
here[*[citation\\ needed](http://en.wikipedia.org/wiki/Wikipedia:Citation_needed "Wikipedia:Citation needed")*]
is that a linearinvariables and linearinparameters relationship
should not be chosen simply for computational convenience, but that all
available knowledge should be deployed in constructing a regression
model. If this knowledge includes the fact that the dependent variable
cannot go outside a certain range of values, this can be made use of in
selecting the model – even if the observed dataset has no values
particularly near such bounds. The implications of this step of choosing
an appropriate functional form for the regression can be great when
extrapolation is considered. At a minimum, it can ensure that any
extrapolation arising from a fitted model is "realistic" (or in accord
with what is known).

# Nonlinear regression


Main article: [Nonlinear
regression](http://en.wikipedia.org/wiki/Nonlinear_regression "Nonlinear regression")

When the model function is not linear in the parameters, the sum of
squares must be minimized by an iterative procedure. This introduces
many complications which are summarized in [Differences between linear
and nonlinear least
squares](http://en.wikipedia.org/wiki/Least_squares#Differences_between_linear_and_nonlinear_least_squares "Least squares")

## Power and sample size calculations

There are no generally agreed methods for relating the number of
observations versus the number of independent variables in the model.
One rule of thumb suggested by Good and Hardin is
![N=m\n](http://upload.wikimedia.org/math/8/0/0/800eff50d3df29826649922dc6d34f4f.png),
where
![N](http://upload.wikimedia.org/math/8/d/9/8d9c307cb7f3c4a32822a51922d1ceaa.png)
is the sample size,
![n](http://upload.wikimedia.org/math/7/b/8/7b8b965ad4bca0e41ab51de7b31363a1.png)
is the number of independent variables and
![m](http://upload.wikimedia.org/math/6/f/8/6f8f57715090da2632453988d9a1501b.png)
is the number of observations needed to reach the desired precision if
the model had only one independent variable.[[24]](http://en.wikipedia.org/wiki/Regression_analysis#cite_note24) For
example, a researcher is building a linear regression model using a
dataset that contains 1000 patients
(![N](http://upload.wikimedia.org/math/8/d/9/8d9c307cb7f3c4a32822a51922d1ceaa.png)).
If he decides that five observations are needed to precisely define a
straight line
(![m](http://upload.wikimedia.org/math/6/f/8/6f8f57715090da2632453988d9a1501b.png)),
then the maximum number of independent variables his model can support
is 4, because

![\\frac{\\log{1000}}{\\log{5}}=4.29](http://upload.wikimedia.org/math/e/2/1/e211fa16defe776e3ded773303bb06ef.png).

# Other methods


Although the parameters of a regression model are usually estimated
using the method of least squares, other methods which have been used
include:

   [Bayesian methods](http://en.wikipedia.org/wiki/Bayesian_method "Bayesian method"), e.g.
    [Bayesian linear
    regression](http://en.wikipedia.org/wiki/Bayesian_linear_regression "Bayesian linear regression")
   [Percentage
    regression](/w/index.php?title=Percentage_regression&action=edit&redlink=1 "Percentage regression (page does not exist)"),
    for situations where reducing *percentage* errors is deemed more
    appropriate.[[25]](http://en.wikipedia.org/wiki/Regression_analysis#cite_note25)
   [Least absolute
    deviations](http://en.wikipedia.org/wiki/Least_absolute_deviations "Least absolute deviations"),
    which is more robust in the presence of outliers, leading to
    [quantile
    regression](http://en.wikipedia.org/wiki/Quantile_regression "Quantile regression")
   [Nonparametric
    regression](http://en.wikipedia.org/wiki/Nonparametric_regression "Nonparametric regression"),
    requires a large number of observations and is computationally
    intensive
   [Distance metric
    learning](/w/index.php?title=Distance_metric_learning&action=edit&redlink=1 "Distance metric learning (page does not exist)"),
    which is learned by the search of a meaningful distance metric in a
    given input space.[[26]](http://en.wikipedia.org/wiki/Regression_analysis#cite_note26)

# Software

Main article: [List of statistical
packages](http://en.wikipedia.org/wiki/List_of_statistical_packages "List of statistical packages")

All major statistical software packages perform [least
squares](http://en.wikipedia.org/wiki/Least_squares "Least squares") regression analysis and
inference. [Simple linear
regression](http://en.wikipedia.org/wiki/Simple_linear_regression "Simple linear regression")
and multiple regression using least squares can be done in some
[spreadsheet](http://en.wikipedia.org/wiki/Spreadsheet "Spreadsheet") applications and on some
calculators. While many statistical software packages can perform
various types of nonparametric and robust regression, these methods are
less standardized; different software packages implement different
methods, and a method with a given name may be implemented differently
in different packages. Specialized regression software has been
developed for use in fields such as survey analysis and neuroimaging.

## [Statistics portal](http://en.wikipedia.org/wiki/Portal:Statistics "Portal:Statistics")
   

*    [Curve fitting](http://en.wikipedia.org/wiki/Curve_fitting "Curve fitting")
*    [Forecasting](http://en.wikipedia.org/wiki/Forecasting "Forecasting")
*    [Fraction of variance   unexplained](http://en.wikipedia.org/wiki/Fraction_of_variance_unexplained "Fraction of variance unexplained")
*    [Kriging](http://en.wikipedia.org/wiki/Kriging "Kriging") (a linear least squares estimation algorithm)
*    [Local regression](http://en.wikipedia.org/wiki/Local_regression "Local regression")
*    [Modifiable areal unit     problem](http://en.wikipedia.org/wiki/Modifiable_areal_unit_problem "Modifiable areal unit problem")
*    [Multivariate adaptive regression     splines](http://en.wikipedia.org/wiki/Multivariate_adaptive_regression_splines "Multivariate adaptive regression splines")
*    [Multivariate normal     distribution](http://en.wikipedia.org/wiki/Multivariate_normal_distribution "Multivariate normal distribution")
*    [Pearson productmoment correlation     coefficient](http://en.wikipedia.org/wiki/Pearson_productmoment_correlation_coefficient "Pearson productmoment correlation coefficient")
*    [Prediction   interval](http://en.wikipedia.org/wiki/Prediction_interval "Prediction interval")
*    [Robust regression](http://en.wikipedia.org/wiki/Robust_regression "Robust regression")
*    [Segmented regression](http://en.wikipedia.org/wiki/Segmented_regression "Segmented regression")
*    [Stepwise regression](http://en.wikipedia.org/wiki/Stepwise_regression "Stepwise regression")
*    [Trend estimation](http://en.wikipedia.org/wiki/Trend_estimation "Trend estimation")

# References

1.  Armstrong, J. Scott (2012). ["Illusions in
    Regression
    Analysis"](http://upenn.academia.edu/JArmstrong/Papers/1162346/Illusions_in_Regression_Analysis).
    *International Journal of Forecasting (forthcoming)* **28** (3):
    689.
    [doi](http://en.wikipedia.org/wiki/Digital_object_identifier "Digital object identifier"):[10.1016/j.ijforecast.2012.02.001](http://dx.doi.org/10.1016%2Fj.ijforecast.2012.02.001). 
2.  David A. Freedman, *Statistical Models: Theory
    and Practice*, Cambridge University Press (2005)
3.  R Dennis Cook; Sanford Weisberg [Criticism
    and Influence Analysis in
    Regression](http://links.jstor.org/sici?sici=00811750%281982%2913%3C313%3ACAIAIR%3E2.0.CO%3B23),
    *Sociological Methodology*, Vol. 13. (1982), pp. 313–361
4.  Legendre_40[A.M.
    Legendre](http://en.wikipedia.org/wiki/AdrienMarie_Legendre "AdrienMarie Legendre").
    [*Nouvelles méthodes pour la détermination des orbites des
    comètes*](http://books.google.ca/books?id=FRcOAAAAQAAJ), Firmin
    Didot, Paris, 1805. “Sur la Méthode des moindres quarrés” appears as
    an appendix.
5.  [C.F.
    Gauss](http://en.wikipedia.org/wiki/Carl_Friedrich_Gauss "Carl Friedrich Gauss"). *Theoria
    Motus Corporum Coelestium in Sectionibus Conicis Solem Ambientum*.
    (1809)
6.  Gauss2_60C.F. Gauss. [*Theoria combinationis
    observationum erroribus minimis
    obnoxiae*](http://books.google.co.za/books?id=ZQ8OAAAAQAAJ&printsec=frontcover&dq=Theoria+combinationis+observationum+erroribus+minimis+obnoxiae&as_brr=3#v=onepage&q=&f=false).
    (1821/1823)
7.  Mogull, Robert G. (2004). *SecondSemester
    Applied Statistics*. Kendall/Hunt Publishing Company. p. 59.
    [ISBN](http://en.wikipedia.org/wiki/International_Standard_Book_Number "International Standard Book Number") [0757511813](http://en.wikipedia.org/wiki/Special:BookSources/0757511813 "Special:BookSources/0757511813"). 
8.  Galton, Francis (1989). "Kinship and
    Correlation (reprinted 1989)". *Statistical Science* (Institute of
    Mathematical Statistics) **4** (2): 80–86.
    [doi](http://en.wikipedia.org/wiki/Digital_object_identifier "Digital object identifier"):[10.1214/ss/1177012581](http://dx.doi.org/10.1214%2Fss%2F1177012581).
    [JSTOR](http://en.wikipedia.org/wiki/JSTOR "JSTOR") [2245330](//www.jstor.org/stable/2245330). 
9.  [Francis
    Galton](http://en.wikipedia.org/wiki/Francis_Galton "Francis Galton"). "Typical laws of
    heredity", Nature 15 (1877), 492–495, 512–514, 532–533. *(Galton
    uses the term "reversion" in this paper, which discusses the size of
    peas.)*
10. Francis Galton. Presidential address, Section
    H, Anthropology. (1885) *(Galton uses the term "regression" in this
    paper, which discusses the height of humans.)*
11. [Yule, G.
    Udny](http://en.wikipedia.org/wiki/G._Udny_Yule "G. Udny Yule") (1897). "On the Theory of
    Correlation". *Journal of the Royal Statistical Society* (Blackwell
    Publishing) **60** (4): 812–54.
    [doi](http://en.wikipedia.org/wiki/Digital_object_identifier "Digital object identifier"):[10.2307/2979746](http://dx.doi.org/10.2307%2F2979746).
    [JSTOR](http://en.wikipedia.org/wiki/JSTOR "JSTOR") [2979746](//www.jstor.org/stable/2979746). 
12. [Pearson,
    Karl](http://en.wikipedia.org/wiki/Karl_Pearson "Karl Pearson"); Yule, G.U.; Blanchard,
    Norman; Lee,Alice (1903). "The Law of Ancestral Heredity".
    *[Biometrika](http://en.wikipedia.org/wiki/Biometrika "Biometrika")* (Biometrika Trust)
    **2** (2): 211–236.
    [doi](http://en.wikipedia.org/wiki/Digital_object_identifier "Digital object identifier"):[10.1093/biomet/2.2.211](http://dx.doi.org/10.1093%2Fbiomet%2F2.2.211).
    [JSTOR](http://en.wikipedia.org/wiki/JSTOR "JSTOR") [2331683](//www.jstor.org/stable/2331683). 
    Cite uses deprecated parameters
    ([help](http://en.wikipedia.org/wiki/Help:CS1_errors#deprecated_params "Help:CS1 errors"))
13. Fisher, R.A. (1922). "The goodness of fit of
    regression formulae, and the distribution of regression
    coefficients". *Journal of the Royal Statistical Society* (Blackwell
    Publishing) **85** (4): 597–612.
    [doi](http://en.wikipedia.org/wiki/Digital_object_identifier "Digital object identifier"):[10.2307/2341124](http://dx.doi.org/10.2307%2F2341124).
    [JSTOR](http://en.wikipedia.org/wiki/JSTOR "JSTOR") [2341124](//www.jstor.org/stable/2341124). 
14. [Ronald A.
    Fisher](http://en.wikipedia.org/wiki/Ronald_A._Fisher "Ronald A. Fisher") (1954).
    [*Statistical Methods for Research
    Workers*](http://psychclassics.yorku.ca/Fisher/Methods/) (Twelfth
    ed.). [Edinburgh](http://en.wikipedia.org/wiki/Edinburgh "Edinburgh"): Oliver and Boyd.
    [ISBN](http://en.wikipedia.org/wiki/International_Standard_Book_Number "International Standard Book Number") [0050021702](http://en.wikipedia.org/wiki/Special:BookSources/0050021702 "Special:BookSources/0050021702"). 
15. Aldrich, John (2005). "Fisher and
    Regression". *Statistical Science* **20** (4): 401–417.
    [doi](http://en.wikipedia.org/wiki/Digital_object_identifier "Digital object identifier"):[10.1214/088342305000000331](http://dx.doi.org/10.1214%2F088342305000000331).
    [JSTOR](http://en.wikipedia.org/wiki/JSTOR "JSTOR") [20061201](//www.jstor.org/stable/20061201). 
16. Rodney Ramcharan. [Regressions: Why Are
    Economists Obessessed with
    Them?](http://www.imf.org/external/pubs/ft/fandd/2006/03/basics.htm)
    March 2006. Accessed 20111203.
17. N Cressie (1996) Change of Support and the
    Modiable Areal Unit Problem. Geographical Systems 3:159–180.
18. Fotheringham, A. Stewart; Brunsdon, Chris;
    Charlton, Martin (2002). *Geographically weighted regression: the
    analysis of spatially varying relationships* (Reprint ed.).
    Chichester, England: John Wiley.
    [ISBN](http://en.wikipedia.org/wiki/International_Standard_Book_Number "International Standard Book Number") [9780471496168](http://en.wikipedia.org/wiki/Special:BookSources/9780471496168 "Special:BookSources/9780471496168"). 
19. Fotheringham, AS; Wong, DWS (1 January 1991).
    "The modifiable areal unit problem in multivariate statistical
    analysis". *Environment and Planning A* **23** (7): 1025–1044.
    [doi](http://en.wikipedia.org/wiki/Digital_object_identifier "Digital object identifier"):[10.1068/a231025](http://dx.doi.org/10.1068%2Fa231025). 
    Cite uses deprecated parameters
    ([help](http://en.wikipedia.org/wiki/Help:CS1_errors#deprecated_params "Help:CS1 errors"))
20. M. H. Kutner, C. J. Nachtsheim, and J. Neter
    (2004), "Applied Linear Regression Models", 4th ed.,
    McGrawHill/Irwin, Boston (p. 25)
21. N. Ravishankar and D. K. Dey (2002), "A First
    Course in Linear Model Theory", Chapman and Hall/CRC, Boca Raton (p.
    101)
22. Steel, R.G.D, and Torrie, J. H., *Principles
    and Procedures of Statistics with Special Reference to the
    Biological Sciences.*, [McGraw
    Hill](http://en.wikipedia.org/wiki/McGraw_Hill "McGraw Hill"), 1960, page 288.
23. Chiang, C.L, (2003) *Statistical methods of
    analysis*, World Scientific. [ISBN
    9812383107](http://en.wikipedia.org/wiki/Special:BookSources/9812383107)  [page 274
    section 9.7.4 "interpolation vs
    extrapolation"](http://books.google.com/books?id=BuPNIbaN5v4C&lpg=PA274&dq=regression%20extrapolation&pg=PA274#v=onepage&q=regression%20extrapolation&f=false)
24. [Good, P.
    I.](http://en.wikipedia.org/wiki/Phillip_Good "Phillip Good"); Hardin, J. W. (2009).
    *Common Errors in Statistics (And How to Avoid Them)* (3rd ed.).
    Hoboken, New Jersey: Wiley. p. 211.
    [ISBN](http://en.wikipedia.org/wiki/International_Standard_Book_Number "International Standard Book Number") [9780470457986](http://en.wikipedia.org/wiki/Special:BookSources/9780470457986 "Special:BookSources/9780470457986"). 
25. Tofallis, C. (2009). ["Least Squares
    Percentage
    Regression"](http://papers.ssrn.com/sol3/papers.cfm?abstract_id=1406472).
    *Journal of Modern Applied Statistical Methods* **7**: 526–534.
    [doi](http://en.wikipedia.org/wiki/Digital_object_identifier "Digital object identifier"):[10.2139/ssrn.1406472](http://dx.doi.org/10.2139%2Fssrn.1406472). 
26. YangJing Long (2009). ["Human age estimation
    by metric learning for regression
    problems"](http://pages.cs.wisc.edu/~huangyz/caip09_Long.pdf).
    *Proc. International Conference on Computer Analysis of Images and
    Patterns*: 74–82. 

