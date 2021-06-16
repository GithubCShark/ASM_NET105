using Microsoft.EntityFrameworkCore.Migrations;

namespace ASM_PS12496_NET105.Migrations
{
    public partial class Dbkhachang : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.AddColumn<string>(
                name: "Email",
                table: "Khachhangs",
                type: "varchar(50)",
                maxLength: 50,
                nullable: false,
                defaultValue: "");
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropColumn(
                name: "Email",
                table: "Khachhangs");
        }
    }
}
