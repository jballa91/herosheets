const fetch = require("node-fetch");
const {PrismaClient} = require("@prisma/client");

let prisma = new PrismaClient();

const seedEquipment = async () => {
    let equipData = await fetch("https://dnd5eapi.co/api/equipment");
    let equipment = await equipData.json();

    let indices = [];

    for (item of equipment.results) {
        indices.push(item.index)
    }

    for (item of indices) {
        let data = await fetch(`https://dnd5eapi.co/api/equipment/${item}`)
        let founditem = await data.json();

        let category = await prisma.equipmentCategory.findUnique({
            where: {
                index: founditem.equipment_category.index
            },
            select: {
                id: true,
            },
        })
        console.log(founditem.name);

        if (!founditem.weapon_category || !founditem.armor_category) {
            await prisma.equipment.create({
                data: {
                    index: founditem.index,
                    name: founditem.name,
                    equipment_category_id: category.id,
                    cost: `${founditem.cost.quantity}${founditem.cost.unit}`,
                    weight: founditem.weight, 
                    url: founditem.url,
                }
            })
        } else if (founditem.weapon_category && !founditem.armor_category) {
            let properties = [];
            for (item of founditem.properties) {
                let prop = await prisma.weaponProperty.findUnique({
                    where: {
                        index: item.index
                    },
                });
                properties.append({id: prop.id})
            }
            await prisma.equipment.create({
                data: {
                    index: founditem.index,
                    name: founditem.name,
                    equipment_category_id: category.id,
                    cost: `${founditem.cost.quantity}${founditem.cost.unit}`,
                    weight: founditem.weight,
                    url: founditem.url,
                    weapon_category: founditem.weapon_category,
                    weapon_range: founditem.weapon_range,
                    category_range: founditem.category_range,
                    damage: `${founditem.damage.damage_dice} ${founditem.damage.name}`,
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
                    cost: `${founditem.cost.quantity}${founditems.cost.unit}`,
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
    console.log("--------------------------");
    console.log("FINISHED SEEDING EQUIPMENT");
    console.log("--------------------------");
}

seedEquipment()