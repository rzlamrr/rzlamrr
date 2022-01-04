#!/bin/bash

export TZ=Asia/Jakarta

var() {
    arr[0]="bot: 👋 Hello Github!"
    arr[1]="bot: 🥳 Yeayyy!"
    arr[2]="bot: 😬 Working from github."
    arr[3]="bot: 👨‍💻 Work, work, work!"
    arr[4]="bot: 🥳 UPdate Quotes:)"
    arr[5]="bot: 😎 New quotes!"
    arr[6]="bot: 🙄 Running task, again."
    arr[7]="bot: 👻 New word."

    api[0]="https://api.quotable.io/random"
    api[1]="https://zenquotes.io/api/random"
    # api[2]="https://goquotes-api.herokuapp.com/api/v1/random?count=1"

    rand=$((RANDOM % ${#arr[@]}))
    rapi=$((RANDOM % ${#api[@]}))
}

main() {
    echo "<h2 align=\"center\"> Hi, RIZAL here!</h2>

- You can call me Rizal 😉
- I am a student in Senior High School 🏫
- Born and live in Indonesia 🇮🇩
- Visit my website <a href="https://rzlamrr.me">here</a> 🌐

<details>
    <summary>Some interesting facts about me!</summary>

    - Settled in Madura Island 🌏

    - Playing game in free time 🎮

    - Also watching movies, listening to music and coding ⭐️

</details>

<hr>
<h3 align=\"center\">Languages & Tools</h3>
<p align=\"center\"><i>As a student, i always want to study more and more. Don't hesitate to give me your knowledge!</i></p>
<p align=\"center\">
<code><img height=\"35\" src=\"https://raw.githubusercontent.com/github/explore/80688e429a7d4ef2fca1e82350fe8e3517d3494d/topics/python/python.png\"></code>
<code><img height=\"35\" src=\"https://raw.githubusercontent.com/github/explore/80688e429a7d4ef2fca1e82350fe8e3517d3494d/topics/javascript/javascript.png\"></code>
<code><img height=\"35\" src=\"https://raw.githubusercontent.com/github/explore/80688e429a7d4ef2fca1e82350fe8e3517d3494d/topics/cpp/cpp.png\"></code>
<code><img height=\"35\" src=\"https://raw.githubusercontent.com/github/explore/80688e429a7d4ef2fca1e82350fe8e3517d3494d/topics/ruby/ruby.png\"></code>
</p>
<p align=\"center\">
<code><img height=\"30\" src=\"https://raw.githubusercontent.com/github/explore/80688e429a7d4ef2fca1e82350fe8e3517d3494d/topics/android/android.png\"></code>
<code><img height=\"30\" src=\"https://raw.githubusercontent.com/github/explore/80688e429a7d4ef2fca1e82350fe8e3517d3494d/topics/linux/linux.png\"></code>
<code><img height=\"30\" src=\"https://raw.githubusercontent.com/github/explore/80688e429a7d4ef2fca1e82350fe8e3517d3494d/topics/windows/windows.png\"></code>
</p>
<p align=\"center\">
<a href=\"https://rzlamrr.github.io\" alt=\"rzlamrr's top languages\"><img src=\"https://dvst-stats.vercel.app/api/top-langs/?username=rzlamrr&langs_count=6&layout=compact&theme=tokyonight&show_icons=true\"></a>
<br>
<a href=\"https://rzlamrr.github.io\" alt=\"rzlamrr's github streak\"><img src=\"https://dvst-streak.herokuapp.com/?user=rzlamrr&theme=tokyonight&fire=DD472C\"></a>
<br>
<a href=\"https://rzlamrr.github.io\" alt=\"rzlamrr's github stat\"><img src=\"https://dvst-stats.vercel.app/api?username=rzlamrr&theme=tokyonight&show_icons=true\"></a>
</p>

<hr>
<h3 align=\"center\">Quote of The Day</h3>
<p align=\"center\">
<blockquote>
<i>\"${quote}\"</i>
<br>
<b>- ${author}</b>
</blockquote>
</p>

<hr>
<h3 align=\"center\">Social Media</h3>
<p align=\"center\"><i>Let's connect and chat! Open to anyone on Earth under the Sun and Moon.</i></p>
<p align=\"center\">
<a href=\"mailto:rzlamrr.dvst@pm.me\" alt=\"Email\"><img height=\"45\" src=\"https://github.com/rzlamrr/rzlamrr/blob/master/rzlamrr/email.svg\"></a>
<a href=\"https://instagram.com/rzlamrr\" alt=\"Instagram\"><img height=\"45\" src=\"https://github.com/rzlamrr/rzlamrr/blob/master/rzlamrr/network.svg\"></a>
<a href=\"https://telegram.me/fakhiralkda\" alt=\"Telegram\"><img height=\"45\" src=\"https://github.com/rzlamrr/rzlamrr/blob/master/rzlamrr/telegram.svg\"></a>
<a href=\"https://twitter.com/rzlamrr\" alt=\"Twitter\"><img height=\"45\" src=\"https://github.com/rzlamrr/rzlamrr/blob/master/rzlamrr/twitter.svg\"></a>
<a href=\"https://github.com/rzlamrr\" alt=\"Github\"><img height=\"45\" src=\"https://github.com/rzlamrr/rzlamrr/blob/master/rzlamrr/github.svg\"></a>
</p>

<hr>
<h2 align=\"center\">Thank You 🙏🏼</h2>
<p align=\"center\"><b><i>Nothing special with me!</i></b></p>
<p align=\"center\">
<a href=\"https://rzlamrr.github.io\" alt=\"rzlamrr's profile visitors\"><img src=\"https://dvstr.herokuapp.com/badge\">
</p>" > README.md
}

clean() {
    if [[ "$1" == "post" ]]; then
        rm -rf data.json
    elif [[ -z "$1" ]]; then
        rm -rf data.json README.md
    fi
}

quotes() {
    if curl -s ${api[$rapi]} > data.json; then
        cat data.json
        if jq -r '.[] .q' data.json; then
            quote=$(jq -r '.[] .q' data.json)
            author=$(jq -r '.[] .a' data.json)
        elif jq -r '.content' data.json; then
            quote=$(jq -r '.content' data.json)
            author=$(jq -r '.author' data.json)
            if [[ "$quote" == "null" ]]; then
                quote=$(jq -r '.quotes[] .text' data.json)
                author=$(jq -r '.quotes[] .author' data.json)
            fi
        fi
    else
        echo "Fetch quotes api failed!"
        exit 1
    fi

    if [[ -z "${quote}" || -z "${author}" || "$quote" == "null" ]]; then
        echo "Fetch quotes failed!"
        exit 1
    fi
}


commit() {
    git config --global user.email "rzlamrr.dvst@protonmail.com"
    git config --global user.name "rzlamrr"
    git commit -asm "${arr[$rand]} (${tgl})"
}

##### START #####
tgl=$(date '+%D %R %Z')
clean
var
quotes
main
clean post
commit
