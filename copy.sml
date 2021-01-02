structure Copy = struct
open TextIO

fun copyStream ins outs =
    if endOfStream ins then ()
    else case input1 ins of
         SOME c => (output1(outs,c);
                    copyStream ins outs)
       | NONE => copyStream ins outs

fun copyFile inf outf =
    let val ins = openIn inf
        val outs = openOut outf
    in (copyStream ins outs;
        closeIn ins;closeOut outs)
    end
end
