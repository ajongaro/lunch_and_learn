## Set Up Instructions:

1. Create a branch off of your Lunch and Learn project as directed by your instructors (eg, "final" or "retake")
2. As you work, you should commit to this branch every 15 minutes.
3. DO NOT push your code to your GitHub repo until the end of the 3 hour assessment, unless otherwise directed by instructors
4. Complete the user story below. You should:
  - TDD all of your work
  - Prioritize getting your code functional before attempting any refactors
  - Write/refactor your code to achieve good code quality

## Assignment

You will be using the "Places API" to search for tourist sights based on the capital city of the country that is provided by the user. Presume that your user will give a valid country. (you can handle edge cases later)

Your endpoint should follow this format:

GET /api/v1/tourist_sights?country=France

Please do not deviate from the names of the endpoint or query parameters. Be sure it is called "tourist_sights" and "country", respectively.
Your API will return:

- A collection of all found tourist sights within a 20000 meter radius of the capital city.
- Each sight should list its: 
  - name
  - formatted address
  - place_id (also from the Place API)

Your response should be in the format below:

{
    "data": [
        {
            "id": null,
            "type": "tourist_sight",
            "attributes": {
                "name": "Tour de l'horloge",
                "address": "Tour de l'horloge, Allée de l'Horloge, 23200 Aubusson, France",
                "place_id": "51d28..."
            }
        },
        {
            "id": null,
            "type": "tourist_sight",
            "attributes": {
                "name": "Le Château",
                "address": "Le Château, D 18, 23150 Ahun, France",
                "place_id": "51934..."
            }
        },
        {
            "id": null,
            "type": "tourist_sight",
            "attributes": {
                "name": "Le Chapître",
                "address": "Le Chapître, Rue du Chapitre, 23200 Aubusson, France",
                "place_id": "517182..."
            }
        },
        ...,
        ...,
    ]
}

Notes: 
1. You will need to use the RESTful Countries API to identify the lat and long of the capital city for the provided country.
2. For the Places API, use the circle radius, and the tourism:sights category
3. You are expected to test ALL code that you write.
4. You are expected to commit at least once every 15 minutes or so.
5. Do not make a PR until we tell you to. (around 11:50am MT)
6. Take a deep breath, you've got this.