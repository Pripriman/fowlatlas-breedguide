import 'breed_models.dart';
import 'breed_traits.dart';

class BreedCatalog {
  static Map<Trait, int> _t({
    int egg = 3,
    int cold = 3,
    int heat = 3,
    int calm = 3,
    int brood = 3,
    int forage = 3,
    int quiet = 3,
    int kids = 3,
  }) =>
      {
        Trait.eggYield: egg,
        Trait.coldHardiness: cold,
        Trait.heatHardiness: heat,
        Trait.temperament: calm,
        Trait.broodiness: brood,
        Trait.foraging: forage,
        Trait.noise: quiet,
        Trait.childFriendly: kids,
      };

  static final List<BreedEntry> all = [
    BreedEntry(
      id: 'rhode_island_red',
      name: 'Rhode Island Red',
      origin: 'United States',
      purpose: BreedPurpose.dualPurpose,
      size: BreedSize.medium,
      eggColor: 'Brown',
      eggsPerYear: 260,
      henWeightKg: 2.9,
      roosterWeightKg: 3.9,
      traits: _t(egg: 5, cold: 4, heat: 4, calm: 4, brood: 2, forage: 4, quiet: 3, kids: 4),
      summary:
          'A rugged American workhorse and one of the most reliable brown-egg layers. Adaptable to most climates and content in confinement or a free range.',
      careTip:
          'Provides steady eggs even through cool months. Roosters can be assertive, so choose hens for a family flock.',
    ),
    BreedEntry(
      id: 'leghorn',
      name: 'Leghorn',
      origin: 'Italy',
      purpose: BreedPurpose.eggLayer,
      size: BreedSize.light,
      eggColor: 'White',
      eggsPerYear: 300,
      henWeightKg: 2.0,
      roosterWeightKg: 2.7,
      traits: _t(egg: 5, cold: 2, heat: 5, calm: 2, brood: 1, forage: 5, quiet: 2, kids: 2),
      summary:
          'The classic high-volume white-egg layer. Light, active and an excellent forager that rarely goes broody.',
      careTip:
          'Flighty and heat-loving; provide shade in summer and a tall run, as they fly well. Large combs need frost protection.',
    ),
    BreedEntry(
      id: 'orpington',
      name: 'Buff Orpington',
      origin: 'England',
      purpose: BreedPurpose.dualPurpose,
      size: BreedSize.heavy,
      eggColor: 'Light brown',
      eggsPerYear: 200,
      henWeightKg: 3.6,
      roosterWeightKg: 4.5,
      traits: _t(egg: 3, cold: 5, heat: 2, calm: 5, brood: 4, forage: 3, quiet: 4, kids: 5),
      summary:
          'A gentle, fluffy giant beloved as a backyard pet. Cold hardy and famously docile, making it a favourite with families.',
      careTip:
          'Dense feathering means they suffer in heat; offer shade and water. Often goes broody and makes a devoted mother.',
    ),
    BreedEntry(
      id: 'plymouth_rock',
      name: 'Plymouth Rock',
      origin: 'United States',
      purpose: BreedPurpose.dualPurpose,
      size: BreedSize.heavy,
      eggColor: 'Brown',
      eggsPerYear: 230,
      henWeightKg: 3.4,
      roosterWeightKg: 4.3,
      traits: _t(egg: 4, cold: 5, heat: 3, calm: 5, brood: 3, forage: 4, quiet: 4, kids: 5),
      summary:
          'The barred Plymouth Rock is a calm, dependable dual-purpose bird and a staple of mixed flocks across the world.',
      careTip:
          'Tolerant of cold and confinement. A great first breed for beginners thanks to its steady, friendly nature.',
    ),
    BreedEntry(
      id: 'sussex',
      name: 'Sussex',
      origin: 'England',
      purpose: BreedPurpose.dualPurpose,
      size: BreedSize.heavy,
      eggColor: 'Cream',
      eggsPerYear: 240,
      henWeightKg: 3.2,
      roosterWeightKg: 4.1,
      traits: _t(egg: 4, cold: 4, heat: 3, calm: 5, brood: 3, forage: 5, quiet: 4, kids: 5),
      summary:
          'An alert, curious and friendly breed that forages keenly yet settles happily into a garden flock.',
      careTip:
          'The Speckled and Light varieties are especially personable. Lays well through winter for a heritage bird.',
    ),
    BreedEntry(
      id: 'wyandotte',
      name: 'Wyandotte',
      origin: 'United States',
      purpose: BreedPurpose.dualPurpose,
      size: BreedSize.heavy,
      eggColor: 'Brown',
      eggsPerYear: 210,
      henWeightKg: 2.7,
      roosterWeightKg: 3.8,
      traits: _t(egg: 4, cold: 5, heat: 3, calm: 4, brood: 3, forage: 3, quiet: 4, kids: 4),
      summary:
          'Round, laced and strikingly handsome. The rose comb resists frostbite, making it a top pick for cold regions.',
      careTip:
          'Self-reliant and weather-hardy. Can be middle of the pecking order; mixes well in a varied flock.',
    ),
    BreedEntry(
      id: 'australorp',
      name: 'Australorp',
      origin: 'Australia',
      purpose: BreedPurpose.dualPurpose,
      size: BreedSize.heavy,
      eggColor: 'Brown',
      eggsPerYear: 280,
      henWeightKg: 3.2,
      roosterWeightKg: 4.0,
      traits: _t(egg: 5, cold: 4, heat: 4, calm: 5, brood: 3, forage: 4, quiet: 4, kids: 5),
      summary:
          'Bred for laying records yet remarkably calm. Glossy black plumage with a green sheen and a sweet disposition.',
      careTip:
          'One of the best all-round backyard birds: prolific, gentle and adaptable to most climates.',
    ),
    BreedEntry(
      id: 'silkie',
      name: 'Silkie',
      origin: 'China',
      purpose: BreedPurpose.ornamental,
      size: BreedSize.bantam,
      eggColor: 'Cream',
      eggsPerYear: 110,
      henWeightKg: 1.1,
      roosterWeightKg: 1.4,
      traits: _t(egg: 2, cold: 3, heat: 3, calm: 5, brood: 5, forage: 2, quiet: 5, kids: 5),
      summary:
          'The famously fluffy, fur-like ornamental breed. Calm, quiet and the broody of choice for hatching other eggs.',
      careTip:
          'Fluff cannot shed rain; keep them dry. Cannot fly, so they need protection from predators and a low roost.',
    ),
    BreedEntry(
      id: 'marans',
      name: 'Marans',
      origin: 'France',
      purpose: BreedPurpose.dualPurpose,
      size: BreedSize.heavy,
      eggColor: 'Dark chocolate',
      eggsPerYear: 200,
      henWeightKg: 3.0,
      roosterWeightKg: 3.9,
      traits: _t(egg: 4, cold: 4, heat: 3, calm: 4, brood: 3, forage: 4, quiet: 4, kids: 4),
      summary:
          'Prized for its deep chocolate-brown eggs. A robust, easy-going French breed that forages well.',
      careTip:
          'Egg colour fades through a laying cycle and returns after a moult. The Cuckoo variety is the most common.',
    ),
    BreedEntry(
      id: 'ameraucana',
      name: 'Ameraucana',
      origin: 'United States',
      purpose: BreedPurpose.eggLayer,
      size: BreedSize.medium,
      eggColor: 'Blue',
      eggsPerYear: 220,
      henWeightKg: 2.5,
      roosterWeightKg: 3.0,
      traits: _t(egg: 4, cold: 5, heat: 3, calm: 4, brood: 2, forage: 4, quiet: 4, kids: 4),
      summary:
          'A true blue-egg layer with a muff, beard and pea comb that shrugs off frost. Active and hardy.',
      careTip:
          'Do not confuse with hybrid "Easter Eggers"; the Ameraucana is a recognised breed laying a consistent blue egg.',
    ),
    BreedEntry(
      id: 'easter_egger',
      name: 'Easter Egger',
      origin: 'United States',
      purpose: BreedPurpose.eggLayer,
      size: BreedSize.medium,
      eggColor: 'Blue / green',
      eggsPerYear: 250,
      henWeightKg: 2.3,
      roosterWeightKg: 2.9,
      traits: _t(egg: 4, cold: 4, heat: 4, calm: 4, brood: 2, forage: 4, quiet: 4, kids: 5),
      summary:
          'A friendly hybrid that lays a rainbow of blue, green and even pinkish eggs. No two birds look quite alike.',
      careTip:
          'Hardy, productive and great for kids who love egg surprises. Each hen lays one colour for life.',
    ),
    BreedEntry(
      id: 'brahma',
      name: 'Brahma',
      origin: 'United States',
      purpose: BreedPurpose.dualPurpose,
      size: BreedSize.heavy,
      eggColor: 'Brown',
      eggsPerYear: 150,
      henWeightKg: 4.0,
      roosterWeightKg: 5.5,
      traits: _t(egg: 3, cold: 5, heat: 2, calm: 5, brood: 3, forage: 3, quiet: 5, kids: 5),
      summary:
          'A towering, feather-legged gentle giant. Calm to the point of placid and superbly cold hardy.',
      careTip:
          'Feathered feet pick up mud; keep the run dry to avoid foot problems. Lays steadily through winter.',
    ),
    BreedEntry(
      id: 'cochin',
      name: 'Cochin',
      origin: 'China',
      purpose: BreedPurpose.ornamental,
      size: BreedSize.heavy,
      eggColor: 'Brown',
      eggsPerYear: 160,
      henWeightKg: 4.0,
      roosterWeightKg: 5.0,
      traits: _t(egg: 3, cold: 5, heat: 2, calm: 5, brood: 4, forage: 2, quiet: 5, kids: 5),
      summary:
          'An enormous ball of soft feathering, more pet than producer. Wonderfully docile and a reliable broody.',
      careTip:
          'Not built for heat or active foraging; thrives as a calm ornamental yard bird and a foster mother.',
    ),
    BreedEntry(
      id: 'maran_blue',
      name: 'Welsummer',
      origin: 'Netherlands',
      purpose: BreedPurpose.dualPurpose,
      size: BreedSize.medium,
      eggColor: 'Terracotta speckled',
      eggsPerYear: 200,
      henWeightKg: 2.7,
      roosterWeightKg: 3.2,
      traits: _t(egg: 4, cold: 4, heat: 3, calm: 4, brood: 2, forage: 5, quiet: 3, kids: 4),
      summary:
          'A handsome forager that lays deep terracotta eggs flecked with darker speckles. The classic cereal-box cockerel.',
      careTip:
          'Loves to range and find its own food. Intelligent and alert without being nervous.',
    ),
    BreedEntry(
      id: 'barnevelder',
      name: 'Barnevelder',
      origin: 'Netherlands',
      purpose: BreedPurpose.dualPurpose,
      size: BreedSize.medium,
      eggColor: 'Dark brown',
      eggsPerYear: 190,
      henWeightKg: 2.8,
      roosterWeightKg: 3.5,
      traits: _t(egg: 4, cold: 4, heat: 3, calm: 5, brood: 2, forage: 4, quiet: 4, kids: 5),
      summary:
          'Double-laced bronze plumage and dark eggs make this a favourite of the showy-yet-practical crowd.',
      careTip:
          'Calm and quiet, suiting suburban gardens. Lays well through grey northern winters.',
    ),
    BreedEntry(
      id: 'minorca',
      name: 'Minorca',
      origin: 'Spain',
      purpose: BreedPurpose.eggLayer,
      size: BreedSize.medium,
      eggColor: 'White',
      eggsPerYear: 220,
      henWeightKg: 3.0,
      roosterWeightKg: 3.6,
      traits: _t(egg: 4, cold: 2, heat: 5, calm: 3, brood: 1, forage: 5, quiet: 3, kids: 3),
      summary:
          'A striking Mediterranean layer with huge combs and wattles, built for hot, dry climates.',
      careTip:
          'The large comb is prone to frostbite; best in warm regions. Lays oversized white eggs.',
    ),
    BreedEntry(
      id: 'andalusian',
      name: 'Andalusian',
      origin: 'Spain',
      purpose: BreedPurpose.eggLayer,
      size: BreedSize.light,
      eggColor: 'White',
      eggsPerYear: 200,
      henWeightKg: 2.3,
      roosterWeightKg: 3.2,
      traits: _t(egg: 4, cold: 2, heat: 5, calm: 2, brood: 1, forage: 5, quiet: 2, kids: 2),
      summary:
          'Slate-blue plumage and a lively, active nature. A heat-loving forager that rarely sits.',
      careTip:
          'Flighty and best with space to range. Blue colour does not breed true, giving black, blue and splash chicks.',
    ),
    BreedEntry(
      id: 'faverolles',
      name: 'Salmon Faverolles',
      origin: 'France',
      purpose: BreedPurpose.dualPurpose,
      size: BreedSize.heavy,
      eggColor: 'Cream',
      eggsPerYear: 180,
      henWeightKg: 3.4,
      roosterWeightKg: 4.1,
      traits: _t(egg: 3, cold: 5, heat: 2, calm: 5, brood: 3, forage: 3, quiet: 5, kids: 5),
      summary:
          'A bearded, muffed, five-toed oddity with a gentle, almost clownish character that endears it to keepers.',
      careTip:
          'So docile it can be bullied by assertive breeds; keep with similarly calm companions.',
    ),
    BreedEntry(
      id: 'polish',
      name: 'Polish',
      origin: 'Poland',
      purpose: BreedPurpose.ornamental,
      size: BreedSize.light,
      eggColor: 'White',
      eggsPerYear: 150,
      henWeightKg: 1.8,
      roosterWeightKg: 2.7,
      traits: _t(egg: 3, cold: 3, heat: 3, calm: 4, brood: 1, forage: 3, quiet: 4, kids: 4),
      summary:
          'Famous for its extravagant crest of feathers. A whimsical show bird that turns heads in any flock.',
      careTip:
          'The crest blocks vision, so they startle easily; approach from the front and keep the crest dry.',
    ),
    BreedEntry(
      id: 'hamburg',
      name: 'Hamburg',
      origin: 'Germany',
      purpose: BreedPurpose.eggLayer,
      size: BreedSize.light,
      eggColor: 'White',
      eggsPerYear: 220,
      henWeightKg: 1.6,
      roosterWeightKg: 2.0,
      traits: _t(egg: 4, cold: 4, heat: 4, calm: 2, brood: 1, forage: 5, quiet: 3, kids: 3),
      summary:
          'A dainty, spangled layer nicknamed the "Dutch Everyday Layer". Extremely active and an outstanding forager.',
      careTip:
          'Needs room to roam and flies well; not suited to small confined runs. Very self-sufficient.',
    ),
    BreedEntry(
      id: 'dorking',
      name: 'Dorking',
      origin: 'England',
      purpose: BreedPurpose.dualPurpose,
      size: BreedSize.heavy,
      eggColor: 'White',
      eggsPerYear: 170,
      henWeightKg: 3.6,
      roosterWeightKg: 4.5,
      traits: _t(egg: 3, cold: 4, heat: 3, calm: 5, brood: 4, forage: 4, quiet: 4, kids: 5),
      summary:
          'An ancient five-toed table breed with a calm, friendly nature and a long history in British gardens.',
      careTip:
          'Short-legged and heavy; provide low roosts. Reliable broodies and gentle with handlers.',
    ),
    BreedEntry(
      id: 'jersey_giant',
      name: 'Jersey Giant',
      origin: 'United States',
      purpose: BreedPurpose.dualPurpose,
      size: BreedSize.heavy,
      eggColor: 'Brown',
      eggsPerYear: 180,
      henWeightKg: 4.5,
      roosterWeightKg: 6.0,
      traits: _t(egg: 3, cold: 5, heat: 2, calm: 5, brood: 2, forage: 3, quiet: 4, kids: 5),
      summary:
          'The largest purebred chicken, bred as a roasting bird. Surprisingly gentle for its imposing size.',
      careTip:
          'Slow to mature and feed-hungry. Needs sturdy, low perches to protect its heavy frame.',
    ),
    BreedEntry(
      id: 'new_hampshire',
      name: 'New Hampshire Red',
      origin: 'United States',
      purpose: BreedPurpose.dualPurpose,
      size: BreedSize.heavy,
      eggColor: 'Brown',
      eggsPerYear: 240,
      henWeightKg: 3.0,
      roosterWeightKg: 3.9,
      traits: _t(egg: 4, cold: 4, heat: 4, calm: 4, brood: 3, forage: 4, quiet: 3, kids: 4),
      summary:
          'A faster-maturing offshoot of the Rhode Island Red, balancing meat, eggs and a calm temperament.',
      careTip:
          'Competitive at the feeder; ensure shy flock-mates get their share. Good early winter layer.',
    ),
    BreedEntry(
      id: 'speckled_sussex',
      name: 'Speckled Sussex',
      origin: 'England',
      purpose: BreedPurpose.dualPurpose,
      size: BreedSize.heavy,
      eggColor: 'Cream',
      eggsPerYear: 220,
      henWeightKg: 3.2,
      roosterWeightKg: 4.1,
      traits: _t(egg: 4, cold: 4, heat: 3, calm: 5, brood: 3, forage: 5, quiet: 4, kids: 5),
      summary:
          'A mahogany, white-tipped beauty that grows more speckled with each moult. Curious, chatty and friendly.',
      careTip:
          'One of the best lap-chicken breeds; follows keepers around the garden and forages enthusiastically.',
    ),
    BreedEntry(
      id: 'campine',
      name: 'Campine',
      origin: 'Belgium',
      purpose: BreedPurpose.eggLayer,
      size: BreedSize.light,
      eggColor: 'White',
      eggsPerYear: 200,
      henWeightKg: 1.8,
      roosterWeightKg: 2.7,
      traits: _t(egg: 4, cold: 3, heat: 4, calm: 3, brood: 1, forage: 5, quiet: 3, kids: 3),
      summary:
          'A barred, alert old Belgian layer that thrives on free range and rarely goes broody.',
      careTip:
          'Active and a strong flyer; needs space and secure fencing. Economical on feed when ranging.',
    ),
    BreedEntry(
      id: 'sebright',
      name: 'Sebright',
      origin: 'England',
      purpose: BreedPurpose.ornamental,
      size: BreedSize.bantam,
      eggColor: 'White',
      eggsPerYear: 80,
      henWeightKg: 0.6,
      roosterWeightKg: 0.6,
      traits: _t(egg: 2, cold: 2, heat: 4, calm: 3, brood: 1, forage: 4, quiet: 3, kids: 3),
      summary:
          'A true bantam laced in gold or silver, kept purely for its jewel-like looks and confident strut.',
      careTip:
          'Tricky to breed and not a layer; choose for ornament. Active and enjoys ranging in fair weather.',
    ),
    BreedEntry(
      id: 'naked_neck',
      name: 'Naked Neck',
      origin: 'Hungary',
      purpose: BreedPurpose.dualPurpose,
      size: BreedSize.medium,
      eggColor: 'Brown',
      eggsPerYear: 200,
      henWeightKg: 2.7,
      roosterWeightKg: 3.5,
      traits: _t(egg: 4, cold: 3, heat: 5, calm: 4, brood: 3, forage: 5, quiet: 4, kids: 4),
      summary:
          'The featherless neck (the "Turken") sheds heat brilliantly, making it ideal for hot climates.',
      careTip:
          'Surprisingly cold tolerant despite the bare neck. Hardy, disease-resistant and an excellent forager.',
    ),
    BreedEntry(
      id: 'fayoumi',
      name: 'Egyptian Fayoumi',
      origin: 'Egypt',
      purpose: BreedPurpose.eggLayer,
      size: BreedSize.light,
      eggColor: 'Off-white',
      eggsPerYear: 200,
      henWeightKg: 1.6,
      roosterWeightKg: 2.0,
      traits: _t(egg: 4, cold: 2, heat: 5, calm: 2, brood: 2, forage: 5, quiet: 3, kids: 2),
      summary:
          'An ancient desert breed prized for heat tolerance and natural disease resistance. Lean and lightning-quick.',
      careTip:
          'Very flighty and nearly wild; best for free range in warm climates rather than a tame garden flock.',
    ),
    BreedEntry(
      id: 'chantecler',
      name: 'Chantecler',
      origin: 'Canada',
      purpose: BreedPurpose.dualPurpose,
      size: BreedSize.heavy,
      eggColor: 'Brown',
      eggsPerYear: 200,
      henWeightKg: 3.4,
      roosterWeightKg: 3.9,
      traits: _t(egg: 4, cold: 5, heat: 2, calm: 4, brood: 3, forage: 4, quiet: 4, kids: 4),
      summary:
          'Bred in Quebec for brutal winters, with a tiny cushion comb that resists frostbite. Calm and practical.',
      careTip:
          'The go-to breed for sub-zero climates; lays through deep cold when others stop.',
    ),
    BreedEntry(
      id: 'icelandic',
      name: 'Icelandic',
      origin: 'Iceland',
      purpose: BreedPurpose.dualPurpose,
      size: BreedSize.light,
      eggColor: 'Cream',
      eggsPerYear: 180,
      henWeightKg: 2.0,
      roosterWeightKg: 2.5,
      traits: _t(egg: 4, cold: 5, heat: 3, calm: 3, brood: 4, forage: 5, quiet: 3, kids: 3),
      summary:
          'A hardy landrace from a thousand years of isolation. Self-reliant, broody and superbly cold adapted.',
      careTip:
          'Excels at free range and raising its own chicks with minimal help. Varied colours within the flock.',
    ),
    BreedEntry(
      id: 'java',
      name: 'Java',
      origin: 'United States',
      purpose: BreedPurpose.dualPurpose,
      size: BreedSize.heavy,
      eggColor: 'Brown',
      eggsPerYear: 150,
      henWeightKg: 3.4,
      roosterWeightKg: 4.3,
      traits: _t(egg: 3, cold: 4, heat: 3, calm: 5, brood: 4, forage: 5, quiet: 4, kids: 4),
      summary:
          'One of the oldest American breeds and a foundation of many others. A calm, capable forager and good mother.',
      careTip:
          'A heritage breed worth preserving; thrives on pasture and needs little fussing.',
    ),
    BreedEntry(
      id: 'delaware',
      name: 'Delaware',
      origin: 'United States',
      purpose: BreedPurpose.dualPurpose,
      size: BreedSize.heavy,
      eggColor: 'Brown',
      eggsPerYear: 220,
      henWeightKg: 2.9,
      roosterWeightKg: 3.8,
      traits: _t(egg: 4, cold: 4, heat: 4, calm: 4, brood: 2, forage: 4, quiet: 3, kids: 5),
      summary:
          'A fast-growing white bird with black hackle barring. Friendly, curious and a balanced homestead choice.',
      careTip:
          'Matures quickly and lays large eggs. Tolerates both heat and cold with ease.',
    ),
    BreedEntry(
      id: 'buckeye',
      name: 'Buckeye',
      origin: 'United States',
      purpose: BreedPurpose.dualPurpose,
      size: BreedSize.heavy,
      eggColor: 'Brown',
      eggsPerYear: 200,
      henWeightKg: 3.0,
      roosterWeightKg: 4.1,
      traits: _t(egg: 4, cold: 5, heat: 3, calm: 4, brood: 3, forage: 5, quiet: 3, kids: 4),
      summary:
          'A mahogany American breed with a pea comb and an active, mouse-hunting streak. Cold hardy and self-reliant.',
      careTip:
          'Dislikes close confinement; give it room to forage. The only breed developed solely by a woman.',
    ),
    BreedEntry(
      id: 'dominique',
      name: 'Dominique',
      origin: 'United States',
      purpose: BreedPurpose.dualPurpose,
      size: BreedSize.medium,
      eggColor: 'Brown',
      eggsPerYear: 230,
      henWeightKg: 2.3,
      roosterWeightKg: 3.2,
      traits: _t(egg: 4, cold: 5, heat: 3, calm: 4, brood: 3, forage: 5, quiet: 4, kids: 5),
      summary:
          "America's oldest breed, with cuckoo barring and a frost-proof rose comb. Calm, thrifty and dependable.",
      careTip:
          'An excellent self-sufficient homestead bird that handles weather extremes and forages efficiently.',
    ),
    BreedEntry(
      id: 'orpington_lavender',
      name: 'Lavender Orpington',
      origin: 'England',
      purpose: BreedPurpose.dualPurpose,
      size: BreedSize.heavy,
      eggColor: 'Light brown',
      eggsPerYear: 200,
      henWeightKg: 3.5,
      roosterWeightKg: 4.4,
      traits: _t(egg: 3, cold: 5, heat: 2, calm: 5, brood: 4, forage: 3, quiet: 5, kids: 5),
      summary:
          'A soft self-blue colour variety of the Orpington, just as gentle and cuddly as the buff, with a pastel coat.',
      careTip:
          'Lavender breeds true, so chicks match their parents. Keep cool in summer under heavy feathering.',
    ),
    BreedEntry(
      id: 'cream_legbar',
      name: 'Cream Legbar',
      origin: 'England',
      purpose: BreedPurpose.eggLayer,
      size: BreedSize.medium,
      eggColor: 'Blue',
      eggsPerYear: 230,
      henWeightKg: 2.5,
      roosterWeightKg: 3.0,
      traits: _t(egg: 4, cold: 4, heat: 4, calm: 4, brood: 2, forage: 5, quiet: 3, kids: 4),
      summary:
          'A crested blue-egg layer that is auto-sexing, so chicks can be told apart by colour at hatch.',
      careTip:
          'Active and a strong forager. The crest is modest, so vision is rarely an issue.',
    ),
    BreedEntry(
      id: 'olive_egger',
      name: 'Olive Egger',
      origin: 'Hybrid',
      purpose: BreedPurpose.eggLayer,
      size: BreedSize.medium,
      eggColor: 'Olive green',
      eggsPerYear: 200,
      henWeightKg: 2.7,
      roosterWeightKg: 3.2,
      traits: _t(egg: 4, cold: 4, heat: 4, calm: 4, brood: 2, forage: 4, quiet: 4, kids: 4),
      summary:
          'A cross of a dark-egg and a blue-egg breed, producing eye-catching olive-green eggs. Variable in looks.',
      careTip:
          'Each hen lays a slightly different shade of olive. Hardy and friendly, like most modern crosses.',
    ),
    BreedEntry(
      id: 'sicilian_buttercup',
      name: 'Sicilian Buttercup',
      origin: 'Italy',
      purpose: BreedPurpose.ornamental,
      size: BreedSize.light,
      eggColor: 'White',
      eggsPerYear: 180,
      henWeightKg: 1.8,
      roosterWeightKg: 2.5,
      traits: _t(egg: 3, cold: 2, heat: 5, calm: 3, brood: 2, forage: 5, quiet: 3, kids: 3),
      summary:
          'Named for its unique cup-shaped, crown-like comb. A heat-loving Mediterranean forager with golden plumage.',
      careTip:
          'The open comb is frost-sensitive; best in warm regions. Active and happiest on free range.',
    ),
    BreedEntry(
      id: 'langshan',
      name: 'Langshan',
      origin: 'China',
      purpose: BreedPurpose.dualPurpose,
      size: BreedSize.heavy,
      eggColor: 'Plum-brown',
      eggsPerYear: 180,
      henWeightKg: 3.4,
      roosterWeightKg: 4.3,
      traits: _t(egg: 3, cold: 4, heat: 3, calm: 5, brood: 3, forage: 4, quiet: 4, kids: 5),
      summary:
          'A tall, elegant feather-legged breed laying eggs with a distinctive plum bloom. Stately and gentle.',
      careTip:
          'Keep feathered feet out of mud. A calm, dignified bird that handles confinement well.',
    ),
    BreedEntry(
      id: 'serama',
      name: 'Serama',
      origin: 'Malaysia',
      purpose: BreedPurpose.ornamental,
      size: BreedSize.bantam,
      eggColor: 'Cream',
      eggsPerYear: 100,
      henWeightKg: 0.3,
      roosterWeightKg: 0.5,
      traits: _t(egg: 2, cold: 1, heat: 5, calm: 5, brood: 3, forage: 2, quiet: 5, kids: 5),
      summary:
          'The smallest chicken in the world, with an upright, confident posture. A charming indoor-friendly pet.',
      careTip:
          'Very cold-sensitive; needs warmth in winter. Tame, quiet and ideal where space is tight.',
    ),
    BreedEntry(
      id: 'australorp_blue',
      name: 'Blue Australorp',
      origin: 'Australia',
      purpose: BreedPurpose.dualPurpose,
      size: BreedSize.heavy,
      eggColor: 'Brown',
      eggsPerYear: 260,
      henWeightKg: 3.0,
      roosterWeightKg: 3.9,
      traits: _t(egg: 5, cold: 4, heat: 4, calm: 5, brood: 3, forage: 4, quiet: 4, kids: 5),
      summary:
          'A slate-blue colour variety of the Australorp, pairing the same prolific laying with a softer hue.',
      careTip:
          'Blue does not breed true, giving a mix of black, blue and splash chicks. Calm and very productive.',
    ),
    BreedEntry(
      id: 'red_star',
      name: 'Red Star',
      origin: 'Hybrid',
      purpose: BreedPurpose.eggLayer,
      size: BreedSize.medium,
      eggColor: 'Brown',
      eggsPerYear: 300,
      henWeightKg: 2.5,
      roosterWeightKg: 3.0,
      traits: _t(egg: 5, cold: 4, heat: 4, calm: 5, brood: 1, forage: 4, quiet: 4, kids: 5),
      summary:
          'A sex-link hybrid bred for maximum eggs. Friendly, undemanding and ideal for first-time keepers.',
      careTip:
          'Lays intensely for two to three years, then tapers. Almost never broody; buy chicks rather than hatch.',
    ),
    BreedEntry(
      id: 'black_star',
      name: 'Black Star',
      origin: 'Hybrid',
      purpose: BreedPurpose.eggLayer,
      size: BreedSize.medium,
      eggColor: 'Brown',
      eggsPerYear: 290,
      henWeightKg: 2.5,
      roosterWeightKg: 3.0,
      traits: _t(egg: 5, cold: 5, heat: 3, calm: 5, brood: 1, forage: 4, quiet: 4, kids: 5),
      summary:
          'The black sex-link counterpart to the Red Star, with extra cold tolerance and the same gentle reliability.',
      careTip:
          'A superb winter layer for cold climates. Chicks are sexable by down colour at hatch.',
    ),
    BreedEntry(
      id: 'appenzeller',
      name: 'Appenzeller Spitzhauben',
      origin: 'Switzerland',
      purpose: BreedPurpose.eggLayer,
      size: BreedSize.light,
      eggColor: 'White',
      eggsPerYear: 180,
      henWeightKg: 1.6,
      roosterWeightKg: 2.0,
      traits: _t(egg: 3, cold: 4, heat: 3, calm: 3, brood: 1, forage: 5, quiet: 3, kids: 3),
      summary:
          'The national breed of Switzerland, crowned with a forward-pointing crest. A nimble alpine forager.',
      careTip:
          'A keen flyer that loves to roost in trees; provide high, secure perches and plenty of range.',
    ),
    BreedEntry(
      id: 'wyandotte_blue',
      name: 'Blue Laced Red Wyandotte',
      origin: 'United States',
      purpose: BreedPurpose.dualPurpose,
      size: BreedSize.heavy,
      eggColor: 'Brown',
      eggsPerYear: 200,
      henWeightKg: 2.7,
      roosterWeightKg: 3.8,
      traits: _t(egg: 4, cold: 5, heat: 3, calm: 4, brood: 3, forage: 3, quiet: 4, kids: 4),
      summary:
          'A spectacular colour variety with rich red feathers edged in steely blue lacing. Hardy and good-natured.',
      careTip:
          'The rose comb resists frost. As eye-catching as it is practical for a cold-climate flock.',
    ),
    BreedEntry(
      id: 'phoenix',
      name: 'Phoenix',
      origin: 'Germany',
      purpose: BreedPurpose.ornamental,
      size: BreedSize.light,
      eggColor: 'Cream',
      eggsPerYear: 130,
      henWeightKg: 1.4,
      roosterWeightKg: 2.0,
      traits: _t(egg: 2, cold: 3, heat: 4, calm: 3, brood: 2, forage: 4, quiet: 4, kids: 3),
      summary:
          'A long-tailed ornamental descended from Japanese fowl, with tail feathers that grow remarkably long.',
      careTip:
          'Keep perches and bedding clean and dry to protect the long tail. A graceful show bird.',
    ),
    BreedEntry(
      id: 'orloff',
      name: 'Russian Orloff',
      origin: 'Russia',
      purpose: BreedPurpose.dualPurpose,
      size: BreedSize.heavy,
      eggColor: 'Tinted',
      eggsPerYear: 160,
      henWeightKg: 3.0,
      roosterWeightKg: 3.6,
      traits: _t(egg: 3, cold: 5, heat: 2, calm: 4, brood: 2, forage: 4, quiet: 4, kids: 4),
      summary:
          'A bearded, muffed breed built for harsh Russian winters, with a walnut comb that defies frostbite.',
      careTip:
          'One of the most cold-hardy breeds available; lays steadily when others quit in deep winter.',
    ),
  ];

  static BreedEntry byId(String id) =>
      all.firstWhere((b) => b.id == id, orElse: () => all.first);

  static List<String> get origins {
    final set = <String>{};
    for (final b in all) {
      set.add(b.origin);
    }
    final list = set.toList()..sort();
    return list;
  }
}
