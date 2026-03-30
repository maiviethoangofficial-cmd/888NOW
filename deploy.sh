#!/bin/sh
PINK='\033[0;35m'
GOLD='\033[0;33m'
CYAN='\033[0;36m'
NC='\033[0m'

clear
echo -e "${PINK}========================================${NC}"
echo -e "${GOLD}    888NOW | HỆ THỐNG DEPLOY TOKEN       ${NC}"
echo -e "${PINK}========================================${NC}"

# Tự động sửa DNS mỗi khi chạy để tránh lỗi mạng trên iPhone
echo "nameserver 8.8.8.8" > /etc/resolv.conf

echo -e "${CYAN}>>> Đang chuẩn bị dữ liệu...${NC}"
git add .
git commit -m "Auto Fix Deploy $(date +'%H:%M')" --allow-empty

echo -e "${GOLD}>>> ĐANG PUSH CODE LÊN GITHUB... (KHÔNG PASS)${NC}"

# Đẩy code lên GitHub
git push origin main --force

if [ $? -eq 0 ]; then
    echo -e "${PINK}----------------------------------------${NC}"
    echo -e "${GOLD}   THÀNH CÔNG! ĐÃ CẬP NHẬT 888NOW       ${NC}"
    echo -e "${PINK}----------------------------------------${NC}"
else
    echo -e "${GOLD}!!! THẤT BẠI: VUI LÒNG KIỂM TRA 4G/WIFI !!!${NC}"
fi
