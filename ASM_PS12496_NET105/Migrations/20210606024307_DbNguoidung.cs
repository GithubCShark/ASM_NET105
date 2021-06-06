using System;
using Microsoft.EntityFrameworkCore.Migrations;

namespace ASM_PS12496_NET105.Migrations
{
    public partial class DbNguoidung : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.CreateTable(
                name: "Nguoidungs",
                columns: table => new
                {
                    NguoidungID = table.Column<int>(nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    UserName = table.Column<string>(type: "nvarchar(100)", nullable: false),
                    FullName = table.Column<string>(type: "nvarchar(100)", nullable: false),
                    Email = table.Column<string>(nullable: false),
                    Title = table.Column<string>(type: "nvarchar(100)", nullable: true),
                    DOB = table.Column<DateTime>(nullable: true),
                    Admin = table.Column<bool>(nullable: false),
                    Locked = table.Column<bool>(nullable: false),
                    Password = table.Column<string>(type: "varchar(50)", maxLength: 50, nullable: false),
                    ConfirmPassword = table.Column<string>(type: "varchar(50)", maxLength: 50, nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Nguoidungs", x => x.NguoidungID);
                });
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropTable(
                name: "Nguoidungs");
        }
    }
}
