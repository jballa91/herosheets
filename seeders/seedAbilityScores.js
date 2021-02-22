const fetch = require("node-fetch");
const chalk = require("chalk");
const { PrismaClient } = require("@prisma/client");

const prisma = new PrismaClient();

const seedAbilityScores = async () => {
    console.log(chalk.yellow("Starting..."));

    let abilityScoreData = await fetch("https://dnd5eapi.co/api/ability-scores");
    let abilityScores = await abilityScoreData.json();

    console.log(chalk.green("Got Ability Scores."));

    let indices = [];
    for (item of abilityScores.results) {
        indices.push(item.index);
    }

    console.log(chalk.yellow("Seeding Ability Scores..."));
    console.log("");
    for (item of indices) {
        let data = await fetch(`https://dnd5eapi.co/api/ability-scores/${item}`);
        let founditem = await data.json();

        console.log(chalk.black.bgCyan("Ability Score:"), chalk.cyan(` ${founditem.name}`));

        await prisma.abilityScore.create({
            data: {
                index: founditem.index,
                name: founditem.name,
                full_name: founditem.full_name,
                description: founditem.desc,
                url: founditem.url,
            },
        });
    }

    await prisma.$disconnect();
    console.log("");
    console.log("");
    console.log(chalk.green("-------------------------------"));
    console.log(chalk.green("FINISHED SEEDING ABILITY SCORES"));
    console.log(chalk.green("-------------------------------"));
}

seedAbilityScores()