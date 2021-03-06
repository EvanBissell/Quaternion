#lang scribble/manual
@title{Quaternions in Racket}
@larger{A project for EECS 448 at the University of Kansas}

@tabular[@#:sep @hspace[3]
                         (list (list @bold{Project Leader:} @verbatim["Bryan Burkett"])
                               (list @bold{Project Analysis:} @verbatim["Eric Chanthorabout"])
                               (list @bold{Programmers: } @verbatim["Tim Clark   Aaron Cowdrey   Thomas Ford"])
                               (list @bold{Documentation:} @verbatim["Dawson Conway   Austin Applegate"])
                               (list @bold{Billing:} @verbatim["Jonathan Coup"])
                               (list @bold{Support:} @verbatim["Justin Arnspiger   Qin Chen"])
                               (list @bold{Business Consultants:} @verbatim["Evan Bissell   Miguel Angel Calderon Mejia"]))]

This library comes with an optional file called "qreader.rkt". It allows for the interpreter to read quaternions in the form @code{a}+@code{b}i+@code{c}j+@code{d}k and convert them
to the form @code{(quaternion a b c d)}. To use this feature type @code{(require "qreader.rkt")} in the definitions window and run your program. In the interpreter type @code{(start)}.
Then you can use the interpreter as you normally would, typing quaternions in their standard infix notation.

@section{Basic User Guide}

@subsection{What a Quaternion is and how to create a Quaternion in Racket}
Quaternions are complex number of the form w + xi + yj + zk, where w, x, y, z are real numbers and i, j, k are imaginary units that satisfy certain conditions.
To use Quaternioin.rkt, at the top of your file type (require "Quaternion.rkt"). This will allow you to use the procedures that were created in "Quaternion.rkt".

To create a Quaternion in racket, type
@codeblock|{
            >(q 1 2 3 4)
            (quaternion 1 2 3 4)
            }|
or 
@codeblock|{
            >(quaternion 1 2 3 4)
            (quaternion 1 2 3 4)
            }|
They are two different ways of creating a quaternion. Both are interchangeable.

The "(quaternion 1 2 3 4)" that was returned represents 1 + 2i + 3j + 4k in the standard form.

@bold{Real part of a Quaternion: }
Since Quaternions are complex numbers meaning they have a real and imaginary part we created a function that will return you the real part of the Quaternion that you input.

To find the real part of a Quaternion in racket, type
@codeblock|{
            > (scalar-part (q 1 2 3 4))
            1
            }|
The "1" that was returned represents the real part of the Quaternion.

@bold{Vector part of a Quaternion:}
Since Quaternions are complex numbers meaning they have a real and imaginary part we created a function that will return you the vector part of the Quaternion that you input.

To find the vector part of a Quaternion in racket, type
@codeblock|{
            > (vector-part (q 1 2 3 4))
            (quaternion 0 2 3 4)
            }|
The "(quaternion 0 2 3 4)" that was returned represents the vector part of the Quaternion which would be 2i + 3j + 4k in standard form.

@subsection{How To Use The Basic Operators For Quaternions}

@bold{How to add Quaternions:}
To add two quaternions you have to add each component separately. For example if we had the two quaternions 2 + 3i + 4j + 5k and 1 + 2i + 3j + 4k to add them we would just simply
add each individual component. For this example we would add 2 + 1 = 3, 3i + 2i = 5i, 4j + 3j = 7j and lastly 5k + 4k = 9k which gives us the quaternion 3 + 5i + 7k + 9k.

To add two Quaternions in racket, type
@codeblock|{
            > (+ (q 2 3 4 5) (q 1 2 3 4))
            (quaternion 3 5 7 9)
            }|
The "(quaternion 3 5 7 9)" that was returned is the result of adding each component of the two quaternions.

@bold{How to subtract Quaternions:}
To add two quaternions you have to add each component separately. For example if we had the two quaternions 2 + 3i + 4j + 5k and 1 + 2i + 3j + 4k to subtract them we would just simply
subtract each individual component. For this example we would subtract 2 - 1 = 1, 3i - 2i = 1i, 4j - 3j = 1j and lastly 5k - 4k = 1k which gives us the quaternion 1 + 1i + 1k + 1k.

To subtract two Quaternions in racket, type
@codeblock|{
            > (- (q 2 3 4 5) (q 1 2 3 4))
            (quaternion 1 1 1 1)
            }|
The "(quaternion 3 5 7 9)" that was returned is the result of subtracting each component of the two quaternions.

@bold{How To Multiply Quaternions:}
To multiply two quaternions we have to take the cross product of the two quaternions. For example if we had the two quaternions 2 + 3i + 4j + 5k and 1 + 2i + 3j + 4k to multiply them we would do the following.
To get the real part of the new quaternion let's call it t0 we would do the following t0 = (2*1 - 3*2 - 4*3 - 5*4) = -36. To calculate the i component, let's call it t1, we would do the following
t1 = (1*3 + 2*2 - 3*5 + 4*4) = 8i. To calculate the j component, let's call it t2, we would do the following t2 = (1*4 + 2*5 + 3*2 - 4*3) = 8j. To calculate the k component, let's call it t3, we would do
the following t3 = (1*5 - 2*4 + 3*3 + 4*2) = 14k. Combine the components back together and we get the quaternions -36 + 8i + 8j + 14k.

To multiply two Quaternions in racket, type
@codeblock|{
            > (* (q 2 3 4 5) (q 1 2 3 4))
            (quaternion -36 8 8 14)
            }|
The "(quaternion -36 8 8 14)" that was returned is the result of multiplying the two quaternions together.

@bold{How To Divide Quaternions:}
To divide two quaternions we have to again break the problem into smaller parts and find each component separately. For example if we had the two quaternions 2 + 3i + 4j + 5k and 1 + 2i + 3j + 4k to divide them we would do the following.
To get the real part of the new quaternion let's call it t0 we would do the following, t0 = (2*1 + 3*2 + 4*3 + 5*4)/(1^2 + 2^2 + 3^2 + 4^2) = 1.3333. To calculate the i component, let's call it t1, we would do the following
t1 = (1*3 - 2*2 + 3*5 - 4*3)/(1^2 + 2^2 + 3^2 + 4^2) = -.066666i. To calculate the j component, let's call it t2, we would do the following t2 = (1*4 + 2*5 - 3*2 - 4*3)/(1^2 + 2^2 + 3^2 + 4^2) = 5.5e-17j which is 
pretty closer to zero. To calculate the k component, let's call it t3, we would do the following t3 = (1*5 + 2*4 - 3*3 - 4*2)/(1^2 + 2^2 + 3^2 + 4^2) = -.133333k. Combine the components back together and we get the quaternions 1.333 - .0666i + 0j - .13333k.

To divide two Quaternions in racket, type
@codeblock|{
            > (/ (q 2 3 4 5) (q 1 2 3 4))
            (quaternion 1.3333333333333335 -0.06666666666666665 5.551115123125783e-17 -0.13333333333333333)
            }|
The "(quaternion 1.3333333333333335 -0.06666666666666665 5.551115123125783e-17 -0.13333333333333333)" that was returned is the result of dividing the two quaternions.

@subsection{How To Use Trigonometric Functions For Quaternions}

@bold{How To Find The Sine Of A Quaternion}
To calculate the sine of a quaternion we used the following formula sin(1 + 2i + 3j + 4k) = (e^((1 + 2i + 3j + 4k)*((2i + 3j + 4k)/(||2i + 3j + 4k||))) + e^-((1 + 2i + 3j + 4k)*((2i + 3j + 4k)/(||2i + 3j + 4k||)))) / 2.

To find the sine of a Quaternion in racket, type
@codeblock|{
            > (sin (q 1 2 3 4))
            (quaternion 91.78371578403477 21.88648685302919 32.82973027954379 43.77297370605838)
            }|
The "(quaternion 91.78371578403477 21.88648685302919 32.82973027954379 43.77297370605838)" that was returned is the sine of the input quaternion.

@bold{How To Find The Cosine Of A Quaternion}
To calculate the cosine of a quaternion we used the following formula cos(1 + 2i + 3j + 4k) = (e^((1 + 2i + 3j + 4k)*((2i + 3j + 4k)/(||2i + 3j + 4k||))) - e^-((1 + 2i + 3j + 4k)*((2i + 3j + 4k)/(||2i + 3j + 4k||)))) / (2*(1 + 2i + 3j + 4k)*((2i + 3j + 4k)/(||2i + 3j + 4k||))).

To find the cosine of a Quaternion in racket, type
@codeblock|{
           > (cos (q 1 2 3 4))
           (quaternion 58.93364616794397 -34.08618369046563 -51.12927553569845 -68.17236738093128)
           }|
The "(quaternion 58.93364616794397 -34.08618369046563 -51.12927553569845 -68.17236738093128)" that was returned is the cosine of the input quaternion.




@section{Reference}

@subsection{Quaternion}
@defstruct[quaternion ([h real?] [i real?] [j real?] [k real?])]{A structure to represent a quaternion. @code{h} represents the real part, @code{i}, @code{j} and @code{k} represent the imaginary parts. If not provided with 4 real numbers, return a type-wrong-format error. Automatically defines @code{(quaternion? x)} to test if @code{x}
                                                                 is a quaternion. @code{(quaternion-h x)}, @code{(quaternion-i x)}, @code{(quaternion-j x)} and @code{(quaternion-k x)} can be used to get the components of a quaternion @code{x}.}

@defproc[(quaternion [h real?] [i real?] [j real?] [k real?]) quaternion?]{Creates a quaternion. The exact same as @code{(quaternion h i j k)}. Allows for faster typing.


@defproc[(eq? [x quaternion?/number?][y quaternion?/number?]) quaternion?/number?]{Defined in the module as @code{(quaternion-equal number1 number2)}. Returns @code{#t} if the two arguments are equivalent mathematically, otherwise returns @code{#f}.
                                                                                   If none of the arguments are quaternions, uses racket's default @code{eq?} function, otherwise it converts each argument into a quaternion, then compares each corresponding element of two quaternions left to right. The and of those comparisons is returned.  
                                                                                   @codeblock|{
                                                                                               > (eq? (quaternion 2 5 34 -1) (quaternion 2 5 34 -1))
                                                                                               #t
                                                                                               > (eq? (quaternion 2 5 34 -1) (quaternion -1 0 4 16))
                                                                                               #f}|}

@defproc[(quaternion->string [x quaternion?/number?]) string?]{Returns @code{x} as a string representation of a quaternion. Given in the form of @code{"(quaternion h i j k)"}.
                                                                       @codeblock|{ 
                                                                                   > (quaternion->string (quaternion 2 5 34 -1))
                                                                                   "(quaternion 2 5 34 -1)"}|}

@defproc[(make-quaternion [x quaternion?/number?]) quaternion?]{Only available within the module. Turns any number into a quaternion. If @code{x} is a quaternion, returns @code{x}. If @code{x} is a number, returns @code{(quaternion (real-part x) (imag-part x) 0 0)}. If neither, returns @code{(quaternion 0 0 0 0)}.
                                                                @codeblock|{
                                                                            > (make-quaternion 2+3i)
                                                                            (quaternion 2 3 0 0)}|}


@defproc[(unmake-quaternion [x quaternion?]) number?/quaternion?]{Only available within the module. If @code{(quaternion-j x)} and @code{(quaternion-k x)} are zero, returns a complex number that is mathematically equivalent to @code{x}, otherwise returns @code{x}.
                                                                  @codeblock|{ 
                                                                              > (unmake-quaternion (quaternion 2 3 0 0))
                                                                              2+3i}|}

@defproc[(scalar-part [x quaternion?/number?]) number?]{Returns the real part of @code{x} as a real number. For quaternions it is equivalent to @code{(quaternion-h x)}.
                                                        @codeblock|{ 
                                                                    > (scalar-part (quaternion 2 5 34 -1))
                                                                    2}|}

@defproc[(vector-part [x quaternion?/number?]) quaternion?]{Returns the imaginary part(s) of @code{x} as a quaternion with real part 0. It does this by converting the input to a quaternion, then subtracting the real part.
                                                            @codeblock|{
                                                                        > (vector-part (quaternion 2 5 34 -1))
                                                                        (quaternion 0 5 34 -1)}|}

@defproc[(norm [x quaternion?])number?]{Defined within the module as @code{(quaternion-norm number)}. Returns the norm of @code{x}. Also known as the magnitude, this represents the length of the quaternion when represented as a vector. Found by taking the square root of the sum of the squares of the components of @code{x}.
                                                                     @codeblock|{ 
                                                                                 > (norm (quaternion 2 5 34 -1))
                                                                                 34.4383507154451252}|} 
                                                                                                       
@defproc[(conjugate [x quaternion?/number?])quaternion?/number?]{Defined within the module as @code{(quaternion-conjugate number)}. Returns the conjugate of @code{x}. This is a new quaternion with the same real part as @code{x} and the opposite vector parts. The product of @code{x} and it's reciprocal is the square of the norm. This a new quaternion with the same real part as @code{x} 
                                                                 This is equivalent to @code{(- (real-part x) (vector-part x))}, however this function takes the opposite of each imaginary component individually. If none of the arguments are quaternions, uses racket's default @code{conjugate} procedure.
                                                                 @codeblock|{
                                                                             > (conjugate (quaternion 2 5 34 -1))
                                                                             (quaternion  2 -5 -34 1)}|}
                                                                                                       
                                                                                                       
                                                                                                       
@defproc[(reciprocal [x quaternion?/number?])quaternion?/number?]{Defined within the module as @code{(quaternion-reciprocal number)}. Returns the reciprocal of @code{x}. A reciprocal is defined such that the reciprocal of @code{x} times @code{x} is 1. This procedure returns a new quaternion whose elements are the corresponding elements of @code{x} is divided by the norm of @code{x} squared. 
                                                                  @codeblock|{
                                                                              > (reciprocal (quaternion 2 5 34 -1))
                                                                              (quaternion 0.0016863406408094439 -0.004215851602023609 -0.028667790893760547 0.0008431703204047219)}|}

@defproc[(unit [w quaternion?])number?]{Defined within the module as @code{(quaternion-unit number)}. Returns the unit quaternion of @code{w}. This is the quaternion divided by its norm, it represents the direction of the quaternion with a parallel quaternion of norm 1.
                                        @codeblock|{
                                                    > (unit (quaternion 2 5 34 -1))
                                                    (quaternion 0.0016863406408094439 -0.004215851602023609 -0.028667790893760547 0.0008431703204047219)}|}



@subsection{Basic Operators}

@defproc[(+ [x quaternion?/number?]...) quaternion?/number?]{Defined within the module as @code{(quaternion-add . quaternions)}. Returns the sum of all @code{x}s, or for only one @code{x} returns @code{x}.
                                                             If none of the arguments are quaternions, uses racket's default @code{+} procedure. Otherwise, converts all arguments to quaternions and returns a new quaternion whose components are the sums of the corresponding components of the arguments.
                                                             @codeblock|{
                                                                         > (+ (quaternion 2 5 34 -1) (quaternion -1 0 4 16))
                                                                         (quaternion 1 5 38 15)
                                                                         > (+ (quaternion 1 2 3 4) 4 (quaternion 4 3 5 -3) 3-2i)
                                                                         (quaternion 12 3 8 1)}|}


@defproc*[([(- [x quaternion?/number?])quaternion?/number?]
[(- [x quaternion?/number?][w quaternion?/number?]...)quaternion?/number?])]{Defined within the module as @code{(quaternion-subtract . quaternions)}. Returns the difference of @code{w} from @code{x}. If no @code{w}s are supplied, returns @code{(- 0 x)} For multiple @code{w}s takes the difference of each @code{w} from @code{x}. If none of the parameters are quaternions, uses racket's default @code{-} procedure, otherwise makes each argument a quaternion,
                                                                                   then returns a new quaternion whose elements are the correspoonding elements of @code{x} minus the corresponding element of each @code{w}.
                                                                                   @codeblock|{
                                                                                               > (- (quaternion 1 2 3 4))
                                                                                               (quaternion -1 -2 -3 -4)
                                                                                               > (- (quaternion 3 2 4 5) (quaternion 5 3 7 5))
                                                                                               (quaternion -2 -1 -3 0)
                                                                                               > (- (quaternion 10 6 22 -5) 4 (quaternion 2 3 4 1) 3+2i)
                                                                                               (quaternion 1 1 18 -6)}|}

@defproc[(quaternion-multiply2 [x quaternion?][w quaternion?]) quaternion?]{Only defined within the module, used by the @code{*} and @code{/} procedures. Returns a quaternion product of two quaternions using the following formulae:
                                                                            @para{h@subscript{new} = h@subscript{x}*h@subscript{w} - i@subscript{x}*i@subscript{w} - j@subscript{x}*j@subscript{w} - k@subscript{x}*k@subscript{w}}
                                                                            @para{i@subscript{new} = h@subscript{x}*i@subscript{w} + i@subscript{x}*h@subscript{w} + j@subscript{x}*k@subscript{w} - k@subscript{x}*j@subscript{w}}
                                                                            @para{j@subscript{new} = h@subscript{x}*j@subscript{w} - i@subscript{x}*k@subscript{w} + j@subscript{x}*h@subscript{w} + k@subscript{x}*i@subscript{w}}
                                                                            @para{k@subscript{new} = h@subscript{x}*k@subscript{w} + i@subscript{x}*j@subscript{w} - j@subscript{x}*i@subscript{w} + k@subscript{x}*h@subscript{w}}}
                                                                                                                        }

@defproc[(* [x quaternion?/number?]...) quaternion?/number?]{Defined within the module as @code{(quaternion-multiply . quaternions)}. Returns the product of all @code{x}s, or for only one @code{x} returns @code{x}.
                                                             If none of the arguments are quaternions, uses racket's default @code{*} procedure. Otherwise, converts all arguments to quaternions and uses @code{quaternion-multiply2} to multiply all of the arguments pairwise from left to right.
                                                             @codeblock|{
                                                                         > (* (quaternion 1 2 3 4) (quaternion 4 3 2 1))
                                                                         (quaternion -12 6 24 12)
                                                                         > (* (quaternion 1 2 3 4) 2 (quaternion 4 3 2 1) 4-8i)
                                                                         (quaternion 0 240 0 480)}|}


@defproc*[([(/ [x quaternion?/number?])quaternion?/number?]
[(/ [x quaternion?/number?][w quaternion?/number?]...)quaternion?/number?])]{Defined within the module as @code{(quaternion-divide . quaternions)}. Returns @code{x} divided by @code{w}. If no @code{w}s are supplied returns @code{(reciprocal x)}, which is equivalent to @code{(/ 1 x)}. If none of the parameters are quaternions, uses racket's default @code{/} procedure.
                                                                             Otherwise calls @code{} @code{x} by the reciprocal of the @code{w}s pairwise.
                                                                            @codeblock|{
                                                                                        > (/ (quaternion 1 1 1 1))
                                                                                        (quaternion .25 -.25 -.25 -.25)
                                                                                        > (/ (quaternion 1 2 3 4) (quaternion -4 2 1 3))
                                                                                        (quaternion 0.5 -0.5 -0.5 -0.5)
                                                                                        > (/ (quaternion 1 2 3 4) 1.5 (quaternion -4 2 1 3) 1+i)
                                                                                        (quaternion 0.1111111111111111 9.25185853854297e-018 -0.11111111111111106 -0.4444444444444443)}|}

@subsection{Advanced Operators}


@defproc[(exp [x quaternion?/number?]) quaternion?/number?]{Defined within the module as @code{(quaternion-exp number)}. Returns Euler's number raised to the power of @code{x}. If @code{x} is not a quaternion, or if the vector-part of @code{x} is the zero vector, uses racket's default @code{exp} procedure.
                                                            Otherwise, uses the equation @code{e}@superscript{a} * (cos(||v||) + unit(v) * sin(||v||)) where a is the scalar-part of @code{x}, v is the vector-part of @code{x}.
                                                            @codeblock|{
                                                                        > (exp (quaternion 2 5 34 -1))
                                                                        (quaternion 5.920249924190469 0.5765955512596606 4.38212618957342 -0.1153191102519321)}|}

@defproc[(log [x quaternion?/number?]) quaternion?/number?]{Defined within the module as @code{(quaternion-log number)}. Returns the natural logarithm of @code{x}. If @code{x} is not a quaternion,  or if the vector-part of @code{x} is the zero vector, uses racket's default @code{log} procedure.
                                                            Otherwise, uses the equation ln(||@code{x}||) + unit(v) * arccos(a/||@code{x}||) where a is the scalar-part of @code{x}, v is the vector-part of @code{x}.
                                                            @codeblock|{
                                                                        > (log (quaternion 2 5 34 -1))
                                                                        (quaternion 3.539170789778835 0.21999401685083464 1.4959593145856755 -0.04399880337016693)}|}


@defproc[(expt [x quaternion?/number?][y quaternion?/number?]) quaternion?/number?]{Defined within the module as @code{(quaternion-expt root power)}. Returns the @code{x} to the power of @code{y}. If if neither argument is a quaternion, uses racket's default @code{expt} procedure.
                                                                                    If @code{y} is @code{0}, returns @code{(quaternion 1 0 0 0)}. If @code{x} is @code{0} and @code{y} is not @code{0}, returns @code{(quaternion 0 0 0 0)}. In all other cases, uses the equation @code{e}@superscript{@code{y}*log(@code{x}).}
                                                                                    @codeblock|{
                                                                                                > (expt (quaternion 2 5 34 -1) (quaternion 1 2 3 4))
                                                                                                (quaternion -0.1742401274849861 0.01354098958151244 0.14979740084735807 0.18830957944329185)}|}


@defproc[(sin [x quaternion?/number?]) quaternion?/number?]{Defined within the module as @code{(quaternion-sin q)}. Returns the sine of @code{x}. If @code{x} is not a quaternion, uses racket's default sin procedure. Otherwise uses the equation (@code{e}@superscript{@code{x}V} + @code{e}@superscript{-@code{x}V})/2 where V is @code{(unit (vector-part x))}.
                                                            @codeblock|{
                                                                       > (sin (quaternion 1 1 1 1))
                                                                       (quaternion 2.4525323488837176 0.8539945649192702 0.8539945649192703 0.8539945649192702)}|}


@defproc[(cos [x quaternion?/number?]) quaternion?/number?]{Defined within the module as @code{(quaternion-cos q)}. Returns the cosine of @code{x}. If @code{x} is not a quaternion, uses racket's default sin procedure. Otherwise uses the equation (@code{e}@superscript{@code{x}V} - @code{e}@superscript{-@code{x}V})/(2 * V) where V is @code{(unit (vector-part x))}.
                                                             @codeblock|{
                                                                         > (cos (quaternion 1 1 1 1))
                                                                         (quaternion 1.5747529115583145 -1.3300177322185738 -1.3300177322185738 -1.3300177322185738)}|}


