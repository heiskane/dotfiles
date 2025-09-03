import httpx

def main() -> None:
    resp = httpx.get(
        f"https://api.openweathermap.org/data/2.5/weather",
        params={
            "lat": 60.2223276,
            "lon": 24.87614,
            "appid": "c54a3a1a77b7dc60c0d578a9ecc10b85",
            "units": "metric"
        }
    )

    data = resp.json()
    description = data["weather"][0]["main"]
    temperature = data["main"]["temp"]
    wind = data["wind"]["speed"]
    print(f"{description} | {temperature} °C | {wind} m/s")


if __name__ == "__main__":
    main()

