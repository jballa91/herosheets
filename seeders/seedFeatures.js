const fetch = require("node-fetch");
const chalk = require("chalk");
const { PrismaClient } = require("@prisma/client");

const prisma = new PrismaClient();

const seedFeatures = async () => {
    console.log("");
    console.log(chalk.yellow("Starting..."));

    let featuresData = await fetch("https://dnd5eapi.co/api/features");
    let features = await featuresData.json();

    console.log(chalk.green("Got Traits."));

    let indices = [];
    for (item of features.results) {
        indices.push(item.index);
    }

    console.log(chalk.yellow("Seeding Features..."));
    console.log("");
    for (item of indices) {
        let data = await fetch(`https://dnd5eapi.co/api/features/${item}`);
        let founditem = await data.json();

        console.log(chalk.black.bgCyan("Feature:"), chalk.cyan(` ${founditem.name}`));

        await prisma.feature.create({
            data: {
                index: founditem.index,
                name: founditem.name,
                level: founditem.level,
                description: founditem.desc,
                url: founditem.url,
            }
        });
    }

    await prisma.$disconnect();
    console.log("");
    console.log("");
    console.log(chalk.green("-------------------------"));
    console.log(chalk.green("FINISHED SEEDING FEATURES"));
    console.log(chalk.green("-------------------------"));
}

module.exports = seedFeatures;