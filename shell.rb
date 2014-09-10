echo ${LANG}

unset LANG

echo ${LIU}${GANG}        => LIU GANG

${LIU:-value}             => if LIU not set,use value (value not set)

${LIU:=value}             => value set

${variable:+value}        => return "" if variable.null

readonly LIU

who | wc -l