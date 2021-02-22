const fetch = require("node-fetch");
const chalk = require("chalk");
const { PrismaClient } = require("@prisma/client");

const prisma = new PrismaClient();

const seedAlignments = async () => {
    console.log(chalk.yellow("Start..."));

    let alignmentsData = await fetch("https://dnd5eapi.co/api/alignments");
    let alignments = await alignmentsData.json();

    console.log(chalk.green("Got Alignments."));

    let indices = [];
    for (item of alignments.results) {
        indices.push(item.index);
    }

    console.log(chalk.yellow("Seeding Alignments..."));
    for (item of indices) {
        let data = await fetch(`https://dnd5eapi.co/api/alignments/${item}`);
        let founditem = await data.json();

        console.log(chalk.black.bgCyan("Alignment:"), chalk.cyan(` ${founditem.name}`));

        await prisma.alignment.create({
            data: {
                index: founditem.index,
                name: founditem.name,
                abbreviation: founditem.abbreviation,
                description: founditem.desc,
                url: founditem.url,
            }
        })
    }

    await prisma.$disconnect();
    console.log("");
    console.log("");
    console.log(chalk.green("---------------------------"));
    console.log(chalk.green("FINISHED SEEDING ALIGNMENTS"));
    console.log(chalk.green("---------------------------"));
}

seedAlignments()