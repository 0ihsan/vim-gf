nn <silent> gf :call Gf()<cr>
" https://github.com/ihsanturk/dotfiles

function Gf()
	let currentword = expand('<cWORD>')
	if IsURL(currentword)
		if !executable('w3m')
			echom 'error: w3m not installed'
		else
			exe 'tabe +0r!w3m\ -dump\ '.fnameescape(currentword) | norm! gg:w/tmp/www<cr>
		end
	else
		e <cfile>
	end
endf

function IsURL(string)
	return (a:string =~ '^http.*://')
endf
