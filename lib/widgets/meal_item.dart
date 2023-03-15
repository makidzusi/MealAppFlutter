import 'package:flutter/material.dart';
import 'package:meal_app/models/meal.dart';
import 'package:meal_app/screens/meal_detail_screen.dart';

class MealItem extends StatelessWidget {
  final String title;
  final String imageUrl;
  final int duration;
  final Complexity complexity;
  final Affordability affordability;
  final String id;
  final Function removeItem;

  const MealItem(
      {super.key,
      required this.title,
      required this.imageUrl,
      required this.duration,
      required this.complexity,
      required this.id,
      required this.removeItem,
      required this.affordability});

  void _selectMeal(BuildContext context) {
    Navigator.of(context)
        .pushNamed(MealDetailScreen.routerName, arguments: id)
        .then((result) {
      if (result != null) {
        removeItem(result);
      }
    });
  }

  String get complexityText {
    switch (complexity) {
      case Complexity.Challenging:
        return 'Challenging';
      case Complexity.Simple:
        return 'Simple';
      case Complexity.Hard:
        return 'Hard';
      default:
        return 'Unkown';
    }
  }

  String get affordabilityText {
    switch (affordability) {
      case Affordability.Affordable:
        return 'Affordable';
      case Affordability.Luxurious:
        return 'Luxurious';
      case Affordability.Pricey:
        return 'Pricey';
      default:
        return 'Unkown';
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => _selectMeal(context),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        elevation: 4,
        margin: const EdgeInsets.all(10),
        child: Column(
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(15),
                      topRight: Radius.circular(15)),
                  child: Image.network(
                    imageUrl,
                    height: 250,
                    width: double.infinity,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      return const Text("Can't load this image");
                    },
                  ),
                ),
                Positioned(
                  bottom: 20,
                  right: 10,
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.black54,
                    ),
                    width: 220,
                    child: Text(
                      title,
                      style: const TextStyle(color: Colors.white, fontSize: 26),
                      softWrap: true,
                      overflow: TextOverflow.fade,
                    ),
                  ),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Row(children: [
                    const Icon(Icons.schedule),
                    const SizedBox(
                      width: 6,
                    ),
                    Text('$duration min')
                  ]),
                  Row(children: [
                    const Icon(Icons.work),
                    const SizedBox(
                      width: 6,
                    ),
                    Text(complexityText)
                  ]),
                  Row(children: [
                    const Icon(Icons.monetization_on_rounded),
                    const SizedBox(
                      width: 6,
                    ),
                    Text(affordabilityText)
                  ])
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
