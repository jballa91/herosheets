const fetch = require("node-fetch")
const chalk = require("chalk");
const {PrismaClient } = require("@prisma/client");

const prisma = new PrismaClient();

const seedProficiencies = async () => {
    console.log(chalk.yellow("Starting..."))
    const profData = await fetch("https://dnd5eapi.co/api/proficiencies");
    const profs = await profData.json();

    console.log(chalk.green("Got Proficiencies."))

    let indices = [];

    for (item of profs.results) {
        indices.push(item.index);
    }

    console.log(chalk.yellow("Seeding..."));
    console.log("");
    for (item of indices) {
        let data = await fetch(`https://dnd5eapi.co/api/proficiencies/${item}`);
        let founditem = await data.json();

        console.log(chalk.black.bgCyan("Proficiency:"), chalk.cyan(` ${founditem.name}`));

        await prisma.proficiency.create({
            data: {
                index: founditem.index,
                name: founditem.name,
                type: founditem.type,
                url: founditem.url,
            }
        })
    }

    await prisma.$disconnect();
    console.log("");
    console.log("")
    console.log(chalk.green("------------------------------"));
    console.log(chalk.green("FINISHED SEEDING PROFICIENCIES"));
    console.log(chalk.green("------------------------------"));
}

seedProficiencies();