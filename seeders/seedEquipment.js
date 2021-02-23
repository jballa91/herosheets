const fetch = require("node-fetch");
const chalk = require("chalk");
const {PrismaClient} = require("@prisma/client");

let prisma = new PrismaClient();

const seedEquipment = async () => {
    console.log("");
    console.log(chalk.yellow("Starting..."))

    let equipData = await fetch("https://dnd5eapi.co/api/equipment");
    let equipment = await equipData.json();

    console.log(chalk.green("Got Equipment."));

    let indices = [];

    for (item of equipment.results) {
        indices.push(item.index);
    }

    console.log(chalk.yellow("Seeding..."));
    console.log("");
    for (item of indices) {
        let data = await fetch(`https://dnd5eapi.co/api/equipment/${item}`)
        let founditem = await data.json();

        console.log(chalk.black.bgCyan("Equipment:"), chalk.cyan(` ${founditem.name}`));


        let category = await prisma.equipmentCategory.findUnique({
            where: {
                index: founditem.equipment_category.index
            },
            select: {
                id: true,
            },
        })

        let gear_category = null;
        if (founditem.gear_category) {
            let gc = await prisma.equipmentCategory.findUnique({
                where: {
                    index: founditem.gear_category.index,
                }
            });
            gear_category = gc.id;
        }

        if (founditem.equipment_category.index !== "weapon" && founditem.equipment_category.index !== "armor") {
            await prisma.equipment.create({
                data: {
                    index: founditem.index,
                    name: founditem.name,
                    equipment_category_id: category.id,
                    gear_category_id: gear_category || null,
                    cost: `${founditem.cost.quantity}${founditem.cost.unit}`,
                    weight: founditem.weight, 
                    url: founditem.url,
                }
            })
        } else if (founditem.equipment_category.index === "weapon" && founditem.equipment_category.index !== "armor") {
            let properties = [];
            for (item of founditem.properties) {
                let prop = await prisma.weaponProperty.findUnique({
                    where: {
                        index: item.index
                    },
                });
                properties.push({id: prop.id})
            }
            await prisma.equipment.create({
                data: {
                    index: founditem.index,
                    name: founditem.name,
                    equipment_category_id: category.id,
                    gear_category_id: gear_category || null,
                    cost: `${founditem.cost.quantity}${founditem.cost.unit}`,
                    weight: founditem.weight,
                    url: founditem.url,
                    weapon_category: founditem.weapon_category,
                    weapon_range: founditem.weapon_range,
                    category_range: founditem.category_range,
                    damage: founditem.damage ? `${founditem.damage.damage_dice} ${founditem.damage.damage_type.name}` : null,
                    range: founditem.range.normal,
                    properties: {
                        connect: [...properties],
                    }
                }
            })
        } else {
            await prisma.equipment.create({
                data: {
                    index: founditem.index,
                    name: founditem.name,
                    equipment_category_id: category.id,
                    gear_category_id: gear_category || null,
                    cost: `${founditem.cost.quantity}${founditem.cost.unit}`,
                    weight: founditem.weight,
                    url: founditem.url,
                    armor_category: founditem.armor_category,
                    armor_class: `${founditem.armor_class.base}, dex: ${founditem.armor_class.dex_bonus}, max: ${founditem.armor_class.max_bonus || null}`,
                    str_minimum: founditem.str_minimum,
                    stealth_disadv: founditem.stealth_disadvantage,
                }
            })
        }
    }

    await prisma.$disconnect();
    console.log("");
    console.log("");
    console.log(chalk.green("--------------------------"));
    console.log(chalk.green("FINISHED SEEDING EQUIPMENT"));
    console.log(chalk.green("--------------------------"));
}

module.exports = seedEquipment;