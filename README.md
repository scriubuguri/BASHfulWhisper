#meteo_data.sh

The `meteo_data.sh` script is a command-line tool that allows you to retrieve weather data and forecasts for a specific city using the OpenWeatherMap API. It provides information such as current temperature, wind speed, humidity, and cloudiness.

## Features

- Retrieve weather data for a specific city
- Units of measurement can be specified (metric, imperial)
- Get current temperature, wind speed, humidity, and cloudiness

## Requirements

- `curl` command-line tool
- `jq` command-line tool
- OpenWeatherMap API key

## Installation

1. Make sure you have the `curl` and `jq` command-line tools installed on your system.
2. Obtain an API key from [OpenWeatherMap](https://openweathermap.org/).
3. Clone the repository or download the `meteo_data.sh` script to your desired location.
4. Open the `meteo_data.sh` script in a text editor.
5. Replace the placeholder `"your_api_key"` with your actual API key obtained from OpenWeatherMap.
6. Save the changes and close the file.

## Usage

The `meteo_data.sh` script can be run from the command line with various options.

```
./meteo_data.sh [-c city] [-u units] [-p param]
```

- `-c city`: Specify the city for which you want to fetch weather data. Defaults to "Bucharest".
- `-u units`: Specify the units of measurement for the weather information. Options: "metric" (default) or "imperial".
- `-p param`: Specify the parameter to retrieve. Options: "t" (current temperature, default), "w" (wind speed), "h" (humidity), "c" (cloudiness).

### Examples

1. Retrieve the current temperature for the default city (Bucharest) using metric units:
   ```
   ./meteo_data.sh
   ```

2. Retrieve the weather data for Pitesti with imperial units:
   ```
   ./meteo_data.sh -c Pitesti -u imperial
   ```

3. Get the wind speed for Iasi:
   ```
   ./meteo_data.sh -c Iasi -p w
   ```

## Author

- scriubuguri

## License

This project is licensed under the GPL-3.0 License - see the [LICENSE](LICENSE) file for details.
