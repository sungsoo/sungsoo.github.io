---
layout: post
title: Radial basis function (RBFs)
date: 2018-03-26
categories: [computer science]
tags: [machine learning]

---

* Article Source: [Radial basis function](https://en.wikipedia.org/wiki/Radial_basis_function)
* Authors: From Wikipedia, the free encyclopedia

---

Radial basis function (RBFs)
========

A **radial basis function (RBF)** is a [real-valued
function](https://en.wikipedia.org/wiki/Real-valued_function "Real-valued function") whose value
depends only on the distance from the
[origin](https://en.wikipedia.org/wiki/Origin_(mathematics) "Origin (mathematics)"), so that ![](https://wikimedia.org/api/rest_v1/media/math/render/svg/6d12a2dacd1864e64507532baaafaa627b6a5f14);
or alternatively on the distance from some other point *c*, called a
*center*, so that ![](https://wikimedia.org/api/rest_v1/media/math/render/svg/1a3edab3a2d723a6a57c052aa1382aa1003e55b1).
Any function ![](https://wikimedia.org/api/rest_v1/media/math/render/svg/72b1f30316670aee6270a28334bdf4f5072cdde4)
that satisfies the property ![](https://wikimedia.org/api/rest_v1/media/math/render/svg/6d12a2dacd1864e64507532baaafaa627b6a5f14)
is a [radial function](https://en.wikipedia.org/wiki/Radial_function "Radial function"). The
norm is usually [Euclidean
distance](https://en.wikipedia.org/wiki/Euclidean_distance "Euclidean distance"), although other
[distance functions](https://en.wikipedia.org/wiki/Distance_function "Distance function") are
also possible.

Sums of radial basis functions are typically used to [approximate given
functions](https://en.wikipedia.org/wiki/Function_approximation "Function approximation"). This
approximation process can also be interpreted as a simple kind of
[neural
network](https://en.wikipedia.org/wiki/Artificial_neural_network "Artificial neural network");
this was the context in which they originally surfaced, in work by
[David Broomhead](https://en.wikipedia.org/wiki/David_Broomhead "David Broomhead") and David
Lowe in 1988, which stemmed
from [Michael J. D.
Powell](https://en.wikipedia.org/wiki/Michael_J._D._Powell "Michael J. D. Powell")'s seminal
research from
1977.
RBFs are also used as a
[kernel](https://en.wikipedia.org/wiki/Radial_basis_function_kernel "Radial basis function kernel")
in [support vector
classification](https://en.wikipedia.org/wiki/Support_vector_machine "Support vector machine").

Types
------
Commonly used types of radial basis functions include (writing ![](https://wikimedia.org/api/rest_v1/media/math/render/svg/5324bd2f4b400968b2cc91466efffb754c504e9e)):

-   [Gaussian](https://en.wikipedia.org/wiki/Gaussian_function "Gaussian function"):

![{](https://wikimedia.org/api/rest_v1/media/math/render/svg/392a6c84ceb04527b95d96858e85c9db4b48cef5)

-   [Multiquadric](/w/index.php?title=Multiquadric&action=edit&redlink=1 "Multiquadric (page does not exist)"):

![](https://wikimedia.org/api/rest_v1/media/math/render/svg/77499abf6079a44b852af18818238dfe9afea002)

-   [Inverse
    quadratic](/w/index.php?title=Inverse_quadratic&action=edit&redlink=1 "Inverse quadratic (page does not exist)"):

![\\phi (r)={\\frac {1}{1+(\\varepsilon
r)\^{2}}}](https://wikimedia.org/api/rest_v1/media/math/render/svg/212325ac03d030a1d4d2c5aa66e5364c42d1e78c)

-   [Inverse
    multiquadric](/w/index.php?title=Inverse_multiquadric&action=edit&redlink=1 "Inverse multiquadric (page does not exist)"):

![\\phi (r)={\\frac {1}{\\sqrt
{1+(\\varepsilon
r)\^{2}}}}](https://wikimedia.org/api/rest_v1/media/math/render/svg/7927d57c097f24a59647fe64b647dd46ce2b9494)

-   [Polyharmonic
    spline](https://en.wikipedia.org/wiki/Polyharmonic_spline "Polyharmonic spline"):

![](https://wikimedia.org/api/rest_v1/media/math/render/svg/f11807be9213f88a51165f3913acbd1cc3ad75f3)

![](https://wikimedia.org/api/rest_v1/media/math/render/svg/763f10c1b059c13169b24e82f993061e8a079ae0)

-   [Thin plate spline](https://en.wikipedia.org/wiki/Thin_plate_spline "Thin plate spline") (a
    special polyharmonic spline):

![](https://wikimedia.org/api/rest_v1/media/math/render/svg/14290cc68e60735b1c2cf411e8bcde6f5203c427)


## Approximation

Main article: [Kernel smoothing](https://en.wikipedia.org/wiki/Kernel_smoothing "Kernel smoothing")

Radial basis functions are typically used to build up [function approximations](https://en.wikipedia.org/wiki/Function_approximation "Function approximation")
of the form

![](https://wikimedia.org/api/rest_v1/media/math/render/svg/9b129b86be238293edd3331fac8937f0311c69a5)

where the approximating function *y*(***x***) is represented as a sum of
*N* radial basis functions, each associated with a different center
***x***~*i*~, and weighted by an appropriate coefficient *w*~*i*~. The
weights *w*~*i*~ can be estimated using the matrix methods of [linear
least squares](https://en.wikipedia.org/wiki/Weighted_least_squares "Weighted least squares"),
because the approximating function is *linear* in the weights.

Approximation schemes of this kind have been particularly
used in [time series
prediction](https://en.wikipedia.org/wiki/Time_series_prediction "Time series prediction") and
[control](https://en.wikipedia.org/wiki/Control_theory "Control theory") of [nonlinear
systems](https://en.wikipedia.org/wiki/Nonlinear_systems "Nonlinear systems") exhibiting
sufficiently simple [chaotic](https://en.wikipedia.org/wiki/Chaos_theory "Chaos theory")
behaviour, 3D reconstruction in [computer
graphics](https://en.wikipedia.org/wiki/Computer_graphics "Computer graphics") (for example,
[hierarchical RBF](https://en.wikipedia.org/wiki/Hierarchical_RBF "Hierarchical RBF") and [Pose
Space
Deformation](https://en.wikipedia.org/wiki/Pose_Space_Deformation "Pose Space Deformation")).

## RBF Network


Main article: [radial basis function
network](https://en.wikipedia.org/wiki/Radial_basis_function_network "Radial basis function network")

[![](https://upload.wikimedia.org/wikipedia/commons/thumb/f/fb/Unnormalized_radial_basis_functions.svg/350px-Unnormalized_radial_basis_functions.svg.png)](https://en.wikipedia.org/wiki/File:Unnormalized_radial_basis_functions.svg)

[](https://en.wikipedia.org/wiki/File:Unnormalized_radial_basis_functions.svg "Enlarge")

Two unnormalized Gaussian radial basis functions in one input dimension.
The basis function centers are located at *x*~1~=0.75 and *x*~2~=3.25.

The sum

y ( x ) = ∑ i = 1 N w i ϕ ( ‖ x − x i ‖ ) , {\\displaystyle y(\\mathbf
{x} )=\\sum \_{i=1}\^{N}w\_{i}\\,\\phi (\\|\\mathbf {x} -\\mathbf {x}
\_{i}\\|),} ![y(\\mathbf {x} )=\\sum \_{i=1}\^{N}w\_{i}\\,\\phi
(\\|\\mathbf {x} -\\mathbf {x}
\_{i}\\|),](https://wikimedia.org/api/rest_v1/media/math/render/svg/9b129b86be238293edd3331fac8937f0311c69a5)

can also be interpreted as a rather simple single-layer type of
[artificial neural
network](https://en.wikipedia.org/wiki/Artificial_neural_network "Artificial neural network")
called a [radial basis function
network](https://en.wikipedia.org/wiki/Radial_basis_function_network "Radial basis function network"),
with the radial basis functions taking on the role of the activation
functions of the network. It can be shown that any continuous function
on a [compact](https://en.wikipedia.org/wiki/Compact_space "Compact space") interval can in
principle be interpolated with arbitrary accuracy by a sum of this form,
if a sufficiently large number *N* of radial basis functions is used.

The approximant *y*(***x***) is differentiable with respect to the
weights *w*~*i*~. The weights could thus be learned using any of the
standard iterative methods for neural networks.

Using radial basis functions in this manner yields a reasonable
interpolation approach provided that the fitting set has been chosen
such that it covers the entire range systematically (equidistant data
points are ideal). However, without a polynomial term that is orthogonal
to the radial basis functions, estimates outside the fitting set tend to
perform poorly.

