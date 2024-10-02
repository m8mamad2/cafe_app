import type { Metadata } from "next";
import localFont from "next/font/local";
import "../globals.css";
import { NextUIProvider } from "@nextui-org/react";
import { geistMono, geistSans } from "../utils/fonts";
import CustomNavbar from "../components/Navbar";



export const metadata: Metadata = {
  title: "Create Next App",
  description: "Generated by create next app",
};

export default function RootLayout({ children }: Readonly<{ children: React.ReactNode }>) {
  return (
    <html lang="en" >
      <body
        style={{ backgroundImage: "radial-gradient(circle 815px at 23.4% -21.8%, rgba(9,29,85,1) 0.2%, rgba(0,0,0,1) 100.2%)" }}
        className={`${geistSans.variable} ${geistMono.variable} antialiased dark`}>
        <NextUIProvider>
          <CustomNavbar />
          { children }
        </NextUIProvider>
      </body>
    </html> 
  );
}