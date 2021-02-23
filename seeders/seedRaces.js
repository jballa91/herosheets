const fetch = require("node-fetch");
const chalk = require("chalk");
const { PrismaClient } = require("@prisma/client");

const prisma = new PrismaClient();

const seedRaces = async () => {
    console.log("");
    console.log(chalk.yellow("Starting..."));

    let racesData = await fetch("https://dnd5eapi.co/api/races");
    let races = await racesData.json();

    console.log(chalk.green("Got Races."));

    let indices = [];
    for (item of races.results) {
        indices.push(item.index);
    }

    console.log(chalk.yellow("Seeding Races..."));
    console.log("");
    for (item of indices) {
        let data = await fetch(`https://dnd5eapi.co/api/races/${item}`);
        let founditem = await data.json();

        console.log(chalk.black.bgCyan("Race:"), chalk.cyan(` ${founditem.name}`));

        let ability_bonuses = ""
        for (item of founditem.ability_bonuses) {
            ability_bonuses += `${item.ability_score.name} +${item.bonus} `
        }

        const starting_proficiencies = [];
        for (item of founditem.starting_proficiencies) {
            starting_proficiencies.push({index: item.index})
        }

        const languages = [];
        for (item of founditem.languages) {
            languages.push({index: item.index});
        }

        const traits = [];
        for (item of founditem.traits) {
            traits.push({index: item.index});
        }

        await prisma.race.create({
            data: {
                index: founditem.index,
                name: founditem.name,
                speed: founditem.speed,
                ability_bonuses: ability_bonuses,
                alignment: founditem.alignment,
                age: founditem.age,
                size: founditem.size,
                size_desc: founditem.size_description,
                starting_proficiencies: {
                    connect: [...starting_proficiencies],
                },
                languages: {
                    connect: [...languages],
                },
                languages_desc: founditem.language_desc,
                traits: {
                    connect: [...traits],
                },
                url: founditem.url,
            },
        })
    }

    await prisma.$disconnect();
    console.log("");
    console.log("");
    console.log(chalk.green("----------------------"));
    console.log(chalk.green("FINISHED SEEDING RACES"));
    console.log(chalk.green("----------------------"));
}

module.exports = seedRaces;