const fetch = require("node-fetch");
const chalk = require("chalk");
const { PrismaClient } = require("@prisma/client");

const prisma = new PrismaClient();

const seedSkills = async () => {
    console.log(chalk.yellow("Starting..."));

    let skillsData = await fetch("https://dnd5eapi.co/api/skills");
    let skills = await skillsData.json();

    console.log(chalk.green("Got Skills."))

    let indices = [];
    for (item of skills.results) {
        indices.push(item.index);
    }

    console.log(chalk.yellow("Seeding Skills..."));
    console.log("");
    for (item of indices) {
        let data = await fetch(`https://dnd5eapi.co/api/skills/${item}`);
        let founditem = await data.json();

        console.log(chalk.black.bgCyan("Skill:"), chalk.cyan(` ${founditem.name}`));

        let abilityScore = await prisma.abilityScore.findUnique({
            where: {
                index: founditem.ability_score.index,
            },
        });

        await prisma.skill.create({
            data: {
                index: founditem.index,
                name: founditem.name,
                ability_score_id: abilityScore.id,
                ability_score: {
                    connect: {
                        id: abilityScore.id,
                    }
                }, 
                url: founditem.url,
            },
        });
    }

    await prisma.$disconnect();
    console.log("");
    console.log("");
    console.log(chalk.green("-----------------------"));
    console.log(chalk.green("FINISHED SEEDING SKILLS"));
    console.log(chalk.green("-----------------------"));
}

module.exports = seedSkills;