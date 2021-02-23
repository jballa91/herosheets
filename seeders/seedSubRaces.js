const fetch = require("node-fetch");
const chalk = require("chalk");
const {PrismaClient} = require("@prisma/client");

const prisma = new PrismaClient();

const seedSubraces = async () => {
    console.log("");
    console.log(chalk.yellow("Starting..."));

    let subracesData = await fetch("https://dnd5eapi.co/api/subraces");
    let subraces = await subracesData.json();

    console.log(chalk.green("Got Subraces."));

    let indices = [];
    for (item of subraces.results) {
        indices.push(item.index);
    }

    console.log(chalk.yellow("Seeding Subraces..."));
    console.log("");
    for (item of indices) {
        let data = await fetch(`https://dnd5eapi.co/api/subraces/${item}`);
        let founditem = await data.json();

        console.log(chalk.black.bgCyan("Subrace:"), chalk.cyan(` ${founditem.name}`));

        let race = await prisma.race.findUnique({
            where: {
                index: founditem.race.index
            }
        });

        let ability_bonuses = ""
        for (item of founditem.ability_bonuses) {
            ability_bonuses += `${item.ability_score.name} +${item.bonus}`;
        }
        
        let starting_proficiencies = [];
        for (item of founditem.starting_proficiencies) {
            starting_proficiencies.push({index: item.index})
        }

        let language_choices = [];
        let language_choice_num = 0
        if (founditem.language_options && founditem.language_options.from.length > 0) {
            language_choice_num = founditem.language_options.choose;
            for (item of founditem.language_options.from) {
                language_choices.push({index: item.index});
            }
        }

        let traits = [];
        for (item of founditem.racial_traits) {
            traits.push({index: item.index});
        }

        let trait_choices = [];
        let trait_choices_num = 0;
        if (founditem.racial_trait_options && founditem.racial_trait_options.from.length > 0) {
            trait_choices_num = founditem.language_options.choose;
            if (founditem.racial_trait_options.from[0].index !== "high-elf-cantrip") {
                for (item of founditem.racial_trait_options.from) {
                    trait_choices.push({index: item.index, });
                }
            } else {
                trait_choices.push({index: "high-elf-cantrip"});
            }
        }

        await prisma.subRace.create({
            data: {
                index: founditem.index,
                name: founditem.name,
                race: {
                    connect: {
                        id: race.id,
                    },
                },
                description: founditem.desc,
                ability_bonuses: ability_bonuses,
                starting_proficiencies: {
                    connect: [...starting_proficiencies],
                },
                language_choice_num: language_choice_num,
                language_choices: {
                    connect: [...language_choices],
                },
                traits: {
                    connect: [...traits],
                },
                traits_choices_num: trait_choices_num,
                trait_choices: {
                    connect: [...trait_choices]
                },
                url: founditem.url,
            },
        });
    }


    await prisma.$disconnect();
    console.log("");
    console.log("");
    console.log(chalk.green("-------------------------"));
    console.log(chalk.green("FINISHED SEEDING SUBRACES"));
    console.log(chalk.green("-------------------------"));
}

module.exports = seedSubraces;