# greeting

cat << EOF
$(print -P '%{\e[38;2;139;106;11m%}')
                  .,-;;//;\=,.
               . 1H@@@MM@M#H/ ,+;,
            ,/X+ +M@@M@MM% ,-%HMMM@X/,  
          -+@MM; SM@@MH+- ;XMMMM@MMMM@+-
         ,@M@@M- XM@X;. -+XXXXXHHH@M@M.--.    
        ,%MM@@MH ,@%=            ..--=-=;=,.
        +@#@@@MX .,              -%HXSS%%%+;
       =; .@M@M$                  .;@MMMM@MM;
       X@= -#MM/                    .+MM@@@M#;
      ,@M@H; ;@1                     . =X#@@@@
      ,@@@MMX, .                    /H- ;@M@M=
      .H@@@@M@+,                    %MM+. %#$.
       /MMMM@MMH\.                  XM@MH; =;
        /%+%SXHH@#=              , .H@@@@MX,
         .,,.,,..,,,           -%H ,@@@@@MX,  
          %MM@@@HHHXM++;;-- .;SMMX =M@@MM%.
           =XMCAMAMAGUEY ,-+HMM@M+ /MMMX=
             =%@M@M#@S .=#@MM@@@M; %M%=
               ,;+#+- /H#MMMMMMM@= =,
                 --. =++%%%%+/;-.

Welcome to Aperture OS!
There is still science to be done :)
$(print -P '%{\e[0m%}')
EOF

#  _    _      _ _          ______                _ 
# | |  | |    | | |        |  ____|              | |
# | |__| | ___| | | ___    | |____   ____ _ _ __ | |
# |  __  |/ _ \ | |/ _ \   |  __\ \ / /  \` | '_ \| |
# | |  | |  __/ | | (_) |  | |___\ V / (_| | | | |_|
# |_|  |_|\___|_|_|\___( ) |______\_/ \__,_|_| |_(_)
#                      |/                           

# Define RGB escape sequences
# fast way to comment all this out
: << 'EOF'
time_color=$'%{\e[38;2;245;189;230m%}'   # #f5bde6
day_color=$'%{\e[38;2;237;135;150m%}'    # #ed8796
reset=$'%{\e[0m%}'

# Get current time (12-hour format) and day of the week
current_time=$(date +"%I:%M %p")
day_of_week=$(date +"%A")

# Pick a random adjective
adjectives=("beautiful" "gorgeous" "wonderful")
random_adj=${adjectives[RANDOM % ${#adjectives[@]} + 1]}

# Print the styled message
print -P "It's ${time_color}${current_time}${reset} on a ${random_adj} ${day_color}${day_of_week}${reset}!"

EOF
