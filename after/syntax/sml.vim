" we need the conceal feature (vim ≥ 7.3)
if !has('conceal')
    finish
endif

" remove the keywords. we'll re-add them below
syntax clear smlOperator

syntax match smlNiceOperator "\<in\>" conceal cchar=∈
syntax match smlNiceOperator "\<orelse\>" conceal cchar=∨
syntax match smlNiceOperator "\<andalso\>" conceal cchar=∧
" include the space after “not” – if present – so that “not a” becomes “¬a”.
" also, don't hide “not” behind ‘¬’ if it is after “is ”.
syntax match smlNiceOperator "\%(is \)\@<!\<not\%( \|\>\)" conceal cchar=¬
syntax match smlNiceOperator "\<not in\>" conceal cchar=∉
syntax match smlNiceOperator "<=" conceal cchar=≤
syntax match smlNiceOperator ">=" conceal cchar=≥
" only conceal “==” if alone, to avoid concealing SCM conflict markers
syntax match smlNiceOperator "=\@<!===\@!" conceal cchar=≡
syntax match smlNiceOperator "!=" conceal cchar=≢
" display empty lists as the empty list
syntax match smlNiceOperator "\[\]" conceal cchar=∅
syntax match hsNiceOperator "\:\:" conceal cchar=∷

syntax keyword smlNiceBuiltin all conceal cchar=∀
syntax keyword smlNiceBuiltin any conceal cchar=∃

syntax keyword smlNiceStatement int conceal cchar=ℤ
syntax keyword smlNiceStatement real conceal cchar=ℝ
syntax keyword smlNiceStatement complex conceal cchar=ℂ
syntax match smlNiceOperator "\'a" conceal cchar=α
syntax match smlNiceOperator "\'b" conceal cchar=β

syntax match smlNiceOperator " \* " conceal cchar=∙
syntax match smlNiceOperator " div " conceal cchar=÷
syntax match smlNiceOperator " / " conceal cchar=÷
syntax match smlNiceOperator "->" conceal cchar=→
syntax match smlNiceOperator "=>" conceal cchar=⇒

syntax keyword smlNiceStatement fn conceal cchar=λ
syntax keyword smlNiceStatement fun conceal cchar=ƒ

hi link smlNiceOperator Operator
hi link smlNiceStatement Statement
hi link smlNiceKeyword Keyword
hi link smlNiceBuiltin Builtin
hi! link Conceal Operator

setlocal conceallevel=1
