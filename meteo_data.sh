#!/bin/bash
#Weather data and forecast for your city 
#Author: scriubuguri 
if [[ -z "$weather_data_key" ]]; then
    api_key="your_api_key"
else
    api_key="$weather_data_key"
fi 

getWeather() {
    city=$1
    units=$2
    param=$3

    weather_data=$(curl -s "http://api.openweathermap.org/data/2.5/weather?q=${city:-"Bucharest"}&appid=$api_key&units=${units:-"metric"}")
}

getTemp() {
    if [ -n "$weather_data" ]; then
        current_temp=$(echo "$weather_data" | jq -r '.main.temp')
        if [ "$units" = "metric" ]; then
            echo "-Current temperature: ${current_temp} C"
        elif [ "$units" = "imperial" ]; then
            echo "-Current temperature: ${current_temp} F"
        else
            echo "-Current temperature: ${current_temp} K"
        fi
    else
        echo "Error fetching data"
    fi
}

getWind() {
    if [ -n "$weather_data" ]; then
        wind_speed=$(echo "$weather_data" | jq -r '.wind.speed')
        echo "-Wind speed: ${wind_speed} m/s"
    else
        echo "Error fetching data"
    fi
}

getHumidity() {
    if [ -n "$weather_data" ]; then
        humidity=$(echo "$weather_data" | jq -r '.main.humidity')
        echo "-Humidity: ${humidity} %"
    else
        echo "Error fetching data"
    fi
}

getClouds() {
    if [ -n "$weather_data" ]; then
        clouds=$(echo "$weather_data" | jq -r '.clouds.all')
        echo "-Cloudiness: ${clouds} %"
    else
        echo "Error fetching data"
    fi
}

main() {
    city="Bucharest"
    units="metric"
    param="t"

    while getopts "c:u:p:" opt; do
        case "$opt" in
            c) city=$OPTARG ;;
            u) units=$OPTARG ;;
            p) param=$OPTARG ;;
            *) echo "Invalid option" >&2; exit 1 ;;
        esac
    done

    getWeather "$city" "$units" "$param"

    case "$param" in
        t) getTemp ;;
        w) getWind ;;
        h) getHumidity ;;
        c) getClouds ;;
        *) echo "Invalid parameter! Try again." ;;
    esac
}

main "$@"


