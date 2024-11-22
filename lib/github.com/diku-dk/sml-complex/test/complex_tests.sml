val _ = print "Testing structure Complex...\n"

fun check b = if b then "OK" else "WRONG";
fun tst0 s s' = print (s ^ "    \t" ^ s' ^ "\n");
fun tst  s b = tst0 s (check  b);

infix ~~
fun a ~~ b = Real.abs(a - b) < 0.000001

open Complex

val () = tst "mag1" (mag (mk (2.0,3.0)) ~~ 3.605551275463989)
val () = tst "mag2" (mag (mk (0.0,0.0)) ~~ 0.0)
val () = tst "mag3" (mag (mk (~1.0,0.0)) ~~ 1.0)

val () = tst "arg1" (arg (mk (2.0,3.0)) ~~ 0.982793723247329)
val () = tst "arg2" (arg (mk (~2.0,3.0)) ~~ 2.158798930342464)
val () = tst "arg3" (arg (mk (~2.0,~3.0)) ~~ ~2.158798930342464)
val () = tst "arg4" (arg (mk (2.0,~3.0)) ~~ ~0.982793723247329)


val () = tst "add" (let val x = mk (2.0,3.0) + mk (4.0,5.0)
                    in re x ~~ 6.0 andalso im x ~~ 8.0
                    end)

val () = tst "sub" (let val x = mk (2.0,5.0) - mk (4.0,3.0)
                    in re x ~~ ~2.0 andalso im x ~~ 2.0
                    end)

val () = tst "mul" (let val x = mk (3.0,2.0) * mk (1.0,4.0)
                    in re x ~~ ~5.0 andalso im x ~~ 14.0
                    end)

val () = tst "div" (let val x = mk (3.0,2.0) / mk (1.0,4.0)
                    in re x ~~ 0.647058824 andalso im x ~~ ~0.588235294
                    end)

val () = tst "sqrt" (let val x = sqrt (mk (2.0,3.0))
                     in re x ~~ 1.674149 andalso im x ~~ 0.895977
                     end)

val () = tst "exp1" (let val x = exp (mk (2.0,3.0))
                     in re x ~~ ~7.315110094901103 andalso im x ~~ 1.0427436562359045
                     end)

val () = tst "exp2" (let val x = exp (mk (0.0,0.0))
                     in re x ~~ 1.0 andalso im x ~~ 0.0
                     end)

val () = tst "ln1" (let val x = ln (mk (1.0,0.0))
                    in re x ~~ 0.0 andalso im x ~~ 0.0
                    end)

val () = tst "ln2" (let val x = ln (mk (2.0,3.0))
                    in re x ~~ 1.2824746787307684 andalso im x ~~ 0.982793723247329
                    end)

val () = tst "conj" (let val x = conj (mk (2.0,3.0))
                     in re x ~~ 2.0 andalso im x ~~ ~3.0
                     end)

val () = tst "neg" (let val x = ~(mk (2.0,3.0))
                    in re x ~~ ~2.0 andalso im x ~~ ~3.0
                    end)

val () = tst "abs1" (let val x = abs(mk (2.0,3.0))
                     in re x ~~ 3.605551275463989 andalso im x ~~ 0.0
                     end)

val () = tst "abs2" (let val x = abs(mk (3.0,4.0))
                     in re x ~~ 5.0 andalso im x ~~ 0.0
                     end)

val () = tst "lt1" (mk (3.0,2.0) < mk (1.0,4.0))

val () = tst "lt2" (not (mk (3.0,3.0) < mk (1.0,4.0)))

val () = tst "gt1" (not(mk (3.0,2.0) > mk (1.0,4.0)))

val () = tst "gt2" (mk (3.0,3.0) > mk (1.0,4.0))


val () = tst "leq1" (mk (2.0,4.0) <= mk (5.0,4.0))

val () = tst "leq2" (mk (3.0,4.0) <= mk (3.0,4.0))

val () = tst "leq3" (not (mk (3.0,3.0) <= mk (1.0,4.0)))

val () = tst "geq1" (not (mk (2.0,4.0) >= mk (5.0,4.0)))

val () = tst "geq2" (mk (3.0,4.0) >= mk (3.0,4.0))

val () = tst "geq3" (mk (3.0,3.0) >= mk (1.0,4.0))

val () = tst "pow1" (let val x = pow(mk (2.0,1.0), mk (2.0,1.0))
                     in re x ~~ ~0.5048246889783189
                        andalso im x ~~ 3.1041440769955293
                     end)

val () = tst "pow2" (let val x = pow(mk (3.0,4.0), mk (2.0,3.0))
                     in re x ~~ 1.4260094753925756
                        andalso im x ~~ 0.6024346301905391
                     end)

val () = tst "fma1" (let val x = fma(mk (2.0,2.0), mk (3.0,1.0), mk (2.0,1.0))
                     in re x ~~ 6.0 andalso im x ~~ 9.0
                     end)

val () = tst "fma2" (let val x = fma(mk (3.0,4.0), mk (5.0,3.0), mk (5.0,3.0))
                     in re x ~~ 8.0 andalso im x ~~ 32.0
                     end)

val () = tst "fromInt" (let val x = fromInt 5
                        in re x ~~ 5.0 andalso im x ~~ 0.0
                        end)

val () = tst "toString1" (toString (mk (2.0,3.0)) = "2.0+3.0i")

val () = tst "toString2" (toString (mk (~2.0,~3.0)) = "~2.0-3.0i")

val () = tst "toString3" (toString (mk (~2.0,0.0)) = "~2.0")

val () = tst "toString4" (toString (mk (0.0,~3.0)) = "~3.0i")

fun toString' c = fmtBrief (StringCvt.GEN NONE) c

val () = tst "toString'1" (toString' (mk (2.0,3.0)) = "2+3i")

val () = tst "toString'2" (toString' (mk (~2.0,~3.0)) = "~2-3i")

val () = tst "toString'3" (toString' (mk (~2.0,0.0)) = "~2")

val () = tst "toString'4" (toString' (mk (0.0,~3.0)) = "~3i")

val () = tst "toString'5" (toString' (mk (0.0,~1.0)) = "~i")

val () = tst "toString'6" (toString' (mk (1.4,1.0)) = "1.4+i")

val () = tst "toString'7" (toString' (mk (~1.4,~1.0)) = "~1.4-i")

val () = tst "toString'8" (toString' (mk (1.4,~1.3)) = "1.4-1.3i")

val () = print "end\n"
